// const db = require('../config/db'); // Adjust the path accordingly

// const saveOrder = async (orderData) => {
//   const { userId, products, totalAmount, paymentMethod, address, status } = orderData;

//   try {
//     const [result] = await db.query(
//       'INSERT INTO orders (user_id, products, total_amount, payment_method, address, status) VALUES (?, ?, ?, ?, ?, ?)',
//       [userId, products, totalAmount, paymentMethod, JSON.stringify(address), status]
//     );
//     console.log('Order saved:', result);
//     return result; // Optionally return the result
//   } catch (error) {
//     console.error("Error saving order:", error);
//     throw error; // Propagate the error
//   }
// };

// module.exports = { saveOrder };


//updated -20th sept - 8.31pm
// const db = require('./config/db'); // Ensure db is correctly imported

// const saveOrder = async (orderData) => {
//   const { userId, products, totalAmount, paymentMethod, address, status } = orderData;

//   const connection = await db.getConnection(); // Get the connection
//   try {
//     await connection.beginTransaction();

//     // Insert the order into the database
//     const [orderResult] = await connection.execute(
//       'INSERT INTO orders (userId, totalAmount, paymentMethod, address, status) VALUES (?, ?, ?, ?, ?)',
//       [userId, totalAmount, paymentMethod, address, status]
//     );

//     const orderId = orderResult.insertId;

//     // Insert each product into an order details table (assumes product info)
//     for (const product of products) {
//       await connection.execute(
//         'INSERT INTO order_products (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)',
//         [orderId, product.productId, product.quantity, product.price]
//       );
//     }

//     await connection.commit();
//     return { insertId: orderId };
//   } catch (error) {
//     await connection.rollback();
//     throw new Error('Error saving order: ' + error.message);
//   } finally {
//     connection.release();
//   }
// };


// //updated 21st sept - 4.09 pm 
// const db = require('../config/db'); // Ensure db is imported

// const saveOrder = async (orderData) => {
//   const { userId, products, totalAmount, paymentMethod, address, status } = orderData;

//   try {
//     const connection = await db.getConnection();
//     await connection.beginTransaction();

//     // Insert the order into the database
//     const [orderResult] = await connection.execute(
//       'INSERT INTO orders (userId, totalAmount, paymentMethod, address, status) VALUES (?, ?, ?, ?, ?)',
//       [userId, totalAmount, paymentMethod, address, status]
//     );

//     const orderId = orderResult.insertId;

//     // Insert each product into an order details table
//     for (const product of products) {
//       await connection.execute(
//         'INSERT INTO order_products (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)',
//         [orderId, product.productId, product.quantity, product.price]
//       );
//     }

//     await connection.commit();
//     return { insertId: orderId };
//   } catch (error) {
//     await connection.rollback();
//     throw new Error('Error saving order: ' + error.message);
//   }
// };

// // Export the function so it can be imported in other files
// module.exports = {
//   saveOrder,
// };



// //updated 21st sept 4.37pm 
// const db = require('../config/db'); // Ensure correct path

// const saveOrder = async (orderData) => {
//   const { userId, products, totalAmount, paymentMethod, address, status } = orderData;

//   try {
//     // Insert the order into the orders table, including products as JSON
//     const [result] = await db.query(
//       'INSERT INTO orders (user_id, products, total_amount, payment_method, address, status) VALUES (?, ?, ?, ?, ?, ?)',
//       [userId, JSON.stringify(products), totalAmount, paymentMethod, JSON.stringify(address), status]
//     );

//     console.log('Order saved:', result);
//     return result; // Optionally return the result
//   } catch (error) {
//     console.error("Error saving order:", error.message);
//     throw error; // Propagate the error
//   }
// };

// module.exports = { saveOrder };



//updated  21st sep 4.55 pm 
const db = require('../config/db'); // Ensure this path is correct

const saveOrder = async (orderData) => {
  const { userId, products, totalAmount, paymentMethod, address, status } = orderData;

  try {
    // Use the promise-based query method
    const [result] = await db.query(
      'INSERT INTO orders (user_id, products, total_amount, payment_method, address, status) VALUES (?, ?, ?, ?, ?, ?)',
      [userId, JSON.stringify(products), totalAmount, paymentMethod, JSON.stringify(address), status]
    );
    
    console.log('Order saved:', result);
    return result; // Optionally return the result
  } catch (error) {
    console.error("Error saving order:", error.message);
    throw error; // Propagate the error
  }
};

module.exports = { saveOrder };
