
// updated 21st sept 4.13pm 

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const authRoutes = require('./routes/auth');
const db = require('./config/db');// Ensure this is for your DB connection
const jwt = require('jsonwebtoken');
const authenticateToken = require('./middleware/authenticateToken');
const { saveOrder } = require('./services/orderService');
const Order = require('./models/Order');
const nodemailer = require('nodemailer'); 
const bcrypt = require('bcrypt');
// Adjust the path to your Order model
 // Import the saveOrder function

const app = express();
app.use(express.json()); 


// const corsOptions = {
//   origin: process.env.CORS_ORIGIN,  // Allow requests from this origin
//   methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],  // Allowed HTTP methods
//   allowedHeaders: ['Content-Type', 'Authorization'],  // Allowed request headers
//   credentials: true  // Allow cookies/authorization headers to be sent
// };

// Enable CORS for your frontend domains
const allowedOrigins = ['https://darshanelderscare.com', 'https://www.darshanelderscare.com'];

app.use(cors({
    origin: function (origin, callback) {
        // Allow requests with no origin like mobile apps or curl requests
        if (!origin) return callback(null, true);
        if (allowedOrigins.indexOf(origin) === -1) {
            // Origin not allowed
            return callback(new Error('Not allowed by CORS'));
        }
        return callback(null, true);
    }
}));

// Ensure OPTIONS requests (preflight) are handled
// app.options('*', cors());


// app.use(cors(corsOptions));
// Authentication middleware
const authenticateUser = (req, res, next) => {
  const token = req.headers['authorization']?.split(' ')[1];

  if (!token) {
    return res.status(401).json({ message: 'No token provided' });
  }

  jwt.verify(token, 'dasTINlcO0HeyIxaCijaBo42+$tAbReg', (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: 'Failed to authenticate token' });
    }

    req.user = decoded; // Attach user info to the request
    next();
  });
};

// Auth routes
app.use('/api/auth', authRoutes);

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Example protected route
app.get('/api/protected', authenticateToken, (req, res) => {
  res.send(`Hello ${req.user.id}, welcome to the protected route!`);
});


//Function to validate OTP
const validateOtp = async (email, otp) => {
  return new Promise((resolve, reject) => {
      const query = 'SELECT otp, otp_expiry FROM users WHERE email = ?';
      db.query(query, [email], (error, results) => {
          if (error) return reject(error);
          if (results.length === 0) return resolve(false);

          const userOtp = results[0].otp;
          const otpExpiry = results[0].otp_expiry;

          // Check if OTP matches and is not expired
          const isOtpValid = userOtp === otp && Date.now() < new Date(otpExpiry).getTime();
          resolve(isOtpValid);
      });
  });
};

// Function to update the user's password
const updateUserPassword = async(email, newPassword) => {
  try {
      const [result] = await db.query("UPDATE users SET password = ? WHERE email = ?", [newPassword, email]);
      return result.affectedRows > 0; // Check if the update was successful
  } catch (error) {
      console.error(error);
      return false;
  }
}

//updated code 24th sept 12.39pm


// POST route to send OTP to email
app.post('/api/sendotp', async (req, res) => {
  const { email } = req.body;

  if (!email) {
    return res.status(400).json({ error: "Email is required" });
  }

  try {
    // Generate a random OTP
    const otp = Math.floor(100000 + Math.random() * 900000).toString();

    // Set up email transport using nodemailer
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER, // Your email
        pass: process.env.EMAIL_PASSWORD, // Your email password or app password
      },
    });

    // Set up email options
    const mailOptions = {
      from: process.env.EMAIL_USER,
      to: email,
      subject: 'Your OTP for Password Reset',
      text: `Your OTP is ${otp}. It will expire in 10 minutes.`,
    };

    // Send the email
    await transporter.sendMail(mailOptions);

    // Store the OTP in the database with expiration (10 minutes)
    const expirationTime = new Date(Date.now() + 10 * 60 * 1000); // 10 minutes from now
    const query = `UPDATE users SET otp = ?, otp_expiry = ? WHERE email = ?`;

    db.query(query, [otp, expirationTime, email], (err, result) => {
      if (err) {
        console.error('Error storing OTP:', err.message);
        return res.status(500).json({ error: 'Error storing OTP.' });
      }

      // Return success message
      res.status(200).json({ message: "OTP sent to your email." });
    });
  } catch (error) {
    console.error('Error sending OTP:', error);
    res.status(500).json({ error: 'Error sending OTP.' });
  }
});


//updated code 24th sept 12.39pm
// POST route to verify OTP and reset password

app.post('/api/resetpassword', async (req, res) => {
  const { email, otp, newPassword } = req.body;

  // Validate the OTP
  const isValidOtp = await validateOtp(email, otp);
  if (!isValidOtp) {
      return res.status(400).json({ error: 'Invalid OTP' });
  }

  // Update the password in the database without hashing
  const result = await updateUserPassword(email, newPassword); // Update directly
  if (!result) {
      return res.status(500).json({ error: 'Failed to update password' });
  }

  res.status(200).json({ message: 'Password changed successfully' });
});



app.post('/api/purchasehistory', authenticateUser, async (req, res) => {
  const { orderId, products, totalAmount, paymentMethod, status } = req.body;
  const userId = req.user.id;

  if (!userId || !orderId || !products || !totalAmount || !paymentMethod) {
    return res.status(400).json({ error: "All fields are required" });
  }

  // Logic to save to purchase history table
  try {
    const purchaseData = {
      userId,
      orderId,
      products,
      totalAmount,
      paymentMethod,
      status,
    };
    // Save purchaseData to your database
    const result = await savePurchaseHistory(purchaseData);
    res.status(201).json({ message: "Purchase history saved successfully", purchaseId: result.insertId });
  } catch (error) {
    console.error("Error saving purchase history:", error.message);
    return res.status(500).json({ error: "Error saving purchase history" });
  }
});

//updated code at 22nd sept 8.42am
// Route to confirm an order
app.post('/api/orders', authenticateUser, async (req, res) => {
 // Log the entire request body

  // const userId = req.user ? req.user.id : null;
  const userId = req.user ? req.user.id : null;
  const {  products, totalAmount, paymentMethod, address, razorpayPaymentId, status } = req.body;
  console.log('Received order details:', req.body); 
  try {

    const addressString = typeof address === 'object' ? JSON.stringify(address) : address;

    // Logic to save the order details in the database
    const newOrder = await Order.create({
      user_id: userId,
      products,
      total_amount:totalAmount,
      payment_method:paymentMethod,
      address:addressString,
      razorpay_payment_id:razorpayPaymentId,
      status,
      
    });

    res.status(201).json(newOrder);
  } catch (error) {
    console.error("Error creating order:", error);
    res.status(500).json({ error: "Failed to save order details" });
  }
});


//updated code 23rd sept 5.35pm 
app.post('/api/saveAddress', authenticateToken, async (req, res) => {
  const userId = req.user.id; // Get user ID from the token


  console.log("Received payload:", req.body); // Log the entire payload

  // Check if addresses is an array and not empty
  const addresses = req.body.addresses;
  if (!addresses || !Array.isArray(addresses) || addresses.length === 0) {
    return res.status(400).json({ error: "At least one address is required." });
  }

  const savedAddresses = []; // Initialize the array to store saved addresses

  try {
    for (const [index, address] of addresses.entries()) {
      const {
        name,
        phone,
        pincode,
        locality,
        addressLine1,
        city,
        state,
        landmark,
        alternatePhone,
        locationTypeTag,
      } = address;

      // Ensure all required fields are present
      if (!name || !phone || !pincode || !locality || !addressLine1 || !city || !state) {
        return res.status(400).json({ error: `All fields are required for address ${index + 1}` });
      }

      // Save the address in the database
      const result = await db.query(
        `INSERT INTO address (user_id, name, phone, pincode, locality, address_line1, city, state, landmark, alternate_phone, location_type_tag) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          userId,
          name,
          phone,
          pincode,
          locality,
          addressLine1,
          city,
          state,
          landmark,
          alternatePhone,
          locationTypeTag,
        ]
      );

      // Retrieve the last inserted ID for each address
      const addressId = result[0].insertId;

      // Add the saved address to the response array
      savedAddresses.push({
        index: index + 1, // Add an index to each address
        id: addressId,
        user_id: userId,
        name,
        phone,
        pincode,
        locality,
        address_line1: addressLine1,
        city,
        state,
        landmark,
        alternate_phone: alternatePhone,
        location_type_tag: locationTypeTag,
      });
    }

    res.status(201).json({ savedAddresses }); // Return all saved addresses with index
  } catch (error) {
    console.error('Error saving addresses:', error);
    res.status(500).json({ error: 'Failed to save addresses', details: error.message });
  }
});



// GET /api/getAddresses
app.get('/api/getAddresses', authenticateToken, (req, res) => {
  const userId = req.user.id; // Assuming the user ID is in the JWT

  db.query('SELECT * FROM address WHERE user_id = ?', [userId], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Server error' });
    }

    res.json(results);
  });
});


// app.post('/api/orders', authenticateUser, async (req, res) => {
//   console.log("Orders endpoint hit");
//   const { products, totalAmount, paymentMethod, address, status } = req.body;
//   const userId = req.user.id; // Get user ID from the token

//   if (!userId || !products || !totalAmount || !paymentMethod || !address) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   const orderData = {
//     userId,
//     products,
//     totalAmount,
//     paymentMethod,
//     address,
//     status: status || 'pending', // Default to 'pending' if not provided
//   };

//   try {
//     const result = await saveOrder(orderData); 
//     res.status(201).json({ message: "Order confirmed successfully", orderId: result.insertId });
//   } catch (error) {
//     console.error("Error saving order:", error.message);
//     return res.status(500).json({ error: "Error saving order" });
//   }
// });

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
