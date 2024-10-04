// const express = require('express');
// const router = express.Router();
// const bcrypt = require('bcrypt');
// const jwt = require('jsonwebtoken');
// const db = require('../config/db'); // Ensure this path is correct

// // POST /login route
// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     // Verify the user by email
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     const [users] = await db.query(query, [email]);

//     // Check if user exists
//     if (users.length === 0) {
//       return res.status(401).json({ success: false, message: 'Invalid email or password' });
//     }

//     const user = users[0];

//     // Compare the password with the hashed password stored in the database
//     const isMatch = await bcrypt.compare(password, user.password);

//     if (!isMatch) {
//       return res.status(401).json({ success: false, message: 'Invalid email or password' });
//     }

//     // Generate JWT token
//     const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//     // Record login time (optional)
//     const loginTime = new Date();
//     await db.execute('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime]);

//     // Send the fullname and token back to the client
//     res.json({ success: true, fullname: user.fullname, token });

//   } catch (err) {
//     console.error('Server error:', err);
//     res.status(500).json({ success: false, message: 'Server error' });
//   }
// });

// module.exports = router;


// const express = require('express');////
// const router = express.Router();
// const bcrypt = require('bcrypt');
// const jwt = require('jsonwebtoken');
// const db = require('../config/db'); // Ensure this path is correct /////



// // Route to register user (Signup)
// router.post("/users", async (req, res) => {
//   const { fullname, email, password, mobile, countryCode } = req.body;

//   // Basic validation
//   if (!fullname || !email || !password || !mobile || !countryCode) {
//       return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//       const hashedPassword = await bcrypt.hash(password, 10);
//       const query = "INSERT INTO users (fullname, email, password, mobile, countryCode) VALUES (?, ?, ?, ?, ?)";

//       db.query(query, [fullname, email, hashedPassword, mobile, countryCode], (err, result) => {
//           if (err) {
//               console.error("Error creating user:", err.message);
//               return res.status(500).json({ error: "Error creating user" });
//           }
//           res.status(200).json({ message: "User registered successfully" });
//       });
//   } catch (err) {
//       console.error("Internal server error:", err.message);
//       res.status(500).json({ error: "Internal server error" });
//   }
// });

// Route to register user (Signup)
// router.post("/users", async (req, res) => {
//   const { fullname, email, password, mobile, countryCode } = req.body;

//   // Basic validation
//   if (!fullname || !email || !password || !mobile || !countryCode) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const query = "INSERT INTO users (fullname, email, password, mobile, countryCode) VALUES (?, ?, ?, ?, ?)";
//     db.query(query, [fullname, email, password, mobile, countryCode], (err, result) => {
//       if (err) {
//         console.error("Error creating user:", err.message);
//         return res.status(500).json({ error: "Error creating user" });
//       }
//       res.status(200).json({ message: "User registered successfully" });
//     });
//   } catch (err) {
//     console.error("Internal server error:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });


// // Ensure you are not hashing the password here:///////
// router.post("/users", async (req, res) => {
//   const { fullname, email, password, mobile, countryCode } = req.body;

//   // Basic validation
//   if (!fullname || !email || !password || !mobile || !countryCode) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // No password hashing
//     const query = "INSERT INTO users (fullname, email, password, mobile, countryCode) VALUES (?, ?, ?, ?, ?)";

//     db.query(query, [fullname, email, password, mobile, countryCode], (err, result) => {
//       if (err) {
//         console.error("Error creating user:", err.message);
//         return res.status(500).json({ error: "Error creating user" });
//       }
//       res.status(200).json({ message: "User registered successfully" });
//     });
//   } catch (err) {
//     console.error("Internal server error:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });


// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     db.query(query, [email], (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       if (results.length === 0) {
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];
//       console.log('Fetched user:', user); // Log user details

//       // Direct password comparison, since no hashing is involved
//       if (password !== user.password) {
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'dasTINlcO0HeyIxaCijaBo42+$tAbReg', { expiresIn: '1h' });

//       // Record login time
//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err);
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });///////


// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     console.log('Executing query with email:', email); // Log email used in query

//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       if (results.length === 0) {
//         console.log('No user found with the given email:', email); // Ensure email is logged
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];
//       console.log('Fetched user:', user); // Log fetched user details

//       const isMatch = await bcrypt.compare(password, user.password);

//       if (!isMatch) {
//         console.log('Password mismatch for email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err);
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });




// // POST /login route
// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       if (results.length === 0) {
//         console.log('No user found with the given email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];
//       console.log('Fetched user:', user); // Log user details

//       // Compare plaintext passwords
//       if (password !== user.password) {
//         console.log('Password mismatch for email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       // Record login time
//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err);
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });



// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     console.log('Executing query with email:', email); // Log email used in query

//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       if (results.length === 0) {
//         console.log('No user found with the given email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];
//       console.log('Fetched user:', user); // Log fetched user details

//       const isMatch = await bcrypt.compare(password, user.password);

//       if (!isMatch) {
//         console.log('Password mismatch for email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err);
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });

// POST /login route
// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     // Verify the user by email
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       // Check if user exists
//       if (results.length === 0) {
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];

//       // Compare the password with the hashed password stored in the database
//       const isMatch = await bcrypt.compare(password, user.password);

//       if (!isMatch) {
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       // Generate JWT token
//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       // Record login time (optional)
//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user.id , fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err, result) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       // Send the fullname and token back to the client
//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err); // Log the detailed error
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });



// // POST /login route
// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     // Verify the user by email
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       // Check if user exists
//       if (results.length === 0) {
//         console.log(`No user found with email: ${email}`);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];
//       console.log('User found:', user); // Log the user found

//       // Compare the password with the hashed password stored in the database
//       const isMatch = await bcrypt.compare(password, user.password);

//       console.log('Password comparison result:', isMatch); // Log the result of comparison

//       if (!isMatch) {
//         console.log('Password mismatch');
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       // Generate JWT token
//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       // Send the fullname and token back to the client
//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err); // Log the detailed error
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });


// // POST /login route
// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     // Verify the user by email
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       // Check if user exists
//       if (results.length === 0) {
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];

//       // Compare the password with the hashed password stored in the database
//       const isMatch = await bcrypt.compare(password, user.password);

//       if (!isMatch) {
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       // Generate JWT token
//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       // Record login time (optional)
//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err, result) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       // Send the fullname and token back to the client
//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err); // Log the detailed error
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });



// // POST /login route
// router.post('/login', async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ success: false, message: 'Email and password are required' });
//   }

//   try {
//     const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
//     db.query(query, [email], async (err, results) => {
//       if (err) {
//         console.error('Error during query execution:', err);
//         return res.status(500).json({ success: false, message: 'Database query error' });
//       }

//       if (results.length === 0) {
//         console.log('No user found with the given email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const user = results[0];
//       console.log('Fetched user:', user); // Log user details

//       const isMatch = await bcrypt.compare(password, user.password);

//       if (!isMatch) {
//         console.log('Password mismatch for email:', email);
//         return res.status(401).json({ success: false, message: 'Invalid email or password' });
//       }

//       const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'defaultsecret', { expiresIn: '1h' });

//       // Record login time
//       const loginTime = new Date();
//       db.query('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime], (err) => {
//         if (err) {
//           console.error('Error logging login time:', err);
//         }
//       });

//       res.json({ success: true, fullname: user.fullname, token });
//     });

//   } catch (err) {
//     console.error('Server error:', err.message || err);
//     res.status(500).json({ success: false, message: 'Server error occurred' });
//   }
// });

// module.exports = router;///////


//updated code 21st sept 8.52pm
const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const db = require('../config/db'); // Ensure this path is correct

// User registration
router.post("/users", async (req, res) => {
  const { fullname, email, password, mobile, countryCode } = req.body;

  // Basic validation
  if (!fullname || !email || !password || !mobile || !countryCode) {
    return res.status(400).json({ error: "All fields are required" });
  }

  try {
    const query = "INSERT INTO users (fullname, email, password, mobile, countryCode) VALUES (?, ?, ?, ?, ?)";
    const values = [fullname, email, password, mobile, countryCode];

    const [result] = await db.execute(query, values);

    res.status(200).json({ message: "User registered successfully", result });
  } catch (err) {
    console.error("Internal server error:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// User login
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ success: false, message: 'Email and password are required' });
  }

  try {
    const query = 'SELECT id, fullname, email, password FROM users WHERE email = ?';
    const [rows] = await db.execute(query, [email]);

    if (rows.length === 0) {
      return res.status(401).json({ success: false, message: 'Invalid email or password' });
    }

    const user = rows[0];

    // Direct password comparison (no hashing)
    if (password !== user.password) {
      return res.status(401).json({ success: false, message: 'Invalid email or password' });
    }

    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'default_secret_key', { expiresIn: '1h' });

    // Log the login time
    const loginTime = new Date();
    await db.execute('INSERT INTO logins (user_id, fullname, login_time) VALUES (?, ?, ?)', [user.id, user.fullname, loginTime]);

    res.json({ success: true,    userId: user.id, fullname: user.fullname, token });
  } catch (err) {
    console.error('Server error:', err.message || err);
    res.status(500).json({ success: false, message: 'Server error occurred' });
  }
});

module.exports = router;
