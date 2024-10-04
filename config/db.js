
// const mysql = require('mysql2');

// // Create a MySQL connection
// const db = mysql.createConnection({
//   host: process.env.DB_HOST || 'localhost',
//   user: process.env.DB_USER || 'root',
//   password: process.env.DB_PASSWORD || 'AMVishwas2001',
//   database: process.env.DB_NAME || 'authectication'
// });

// // Connect to the database and handle connection errors
// db.connect((err) => {
//   if (err) {
//     console.error('Error connecting to the database:', err.message);
//   } else {
//     console.log('Connected to the MySQL database.');
//   }
// });

// module.exports = db;


// const mysql = require('mysql2/promise');

// const db = mysql.createPool({
//   host: process.env.DB_HOST || 'localhost',
//   user: process.env.DB_USER || 'root',
//   password: process.env.DB_PASSWORD || 'your_password', // Use your actual password
//   database: process.env.DB_NAME || 'your_database',
// });

// // Test the connection
// const testConnection = async () => {
//   try {
//     const connection = await db.getConnection();
//     console.log("Connected to MySQL");
//     connection.release();
//   } catch (error) {
//     console.error("Error connecting to MySQL:", error.message);
//     process.exit(1); // Exit if connection fails
//   }
// };

// testConnection(); // Call the function to test the connection

// module.exports = db;



// const mysql = require('mysql2/promise');

// // Create MySQL connection
// const db = mysql.createPool({
//   host: process.env.DB_HOST || 'localhost',
//   user: process.env.DB_USER || 'root',
//   password: process.env.DB_PASSWORD || 'AMVishwas2001', // Use your actual password
//   database: process.env.DB_NAME || 'authectication',
// });

// // // Connect to MySQL
// // db.then(connection => {
// //   console.log("Connected to MySQL");
// // }).catch(err => {
// //   console.error("Error connecting to MySQL:", err.message);
// //   process.exit(1); // Exit if connection fails
// // });

// module.exports = db;


// const mysql = require('mysql2/promise');

// // Create MySQL connection pool
// const db = mysql.createPool({
//   host: process.env.DB_HOST || 'localhost',
//   user: process.env.DB_USER || 'root',
//   password: process.env.DB_PASSWORD || 'AMVishwas2001', // Use your actual password
//   database: process.env.DB_NAME || 'authectication',
// });

// // Export the database pool
// module.exports = db;


//updated 21st sept 4.53pm 

// // config/db.js
// const mysql = require('mysql2/promise'); // Use the promise-based version

// const pool = mysql.createPool({
//   host: 'localhost',
//   user: 'root',
//   password: 'AMVishwas2001',
//   database: 'authectication',
//   waitForConnections: true,
//   connectionLimit: 10,
//   queueLimit: 0
// });

// module.exports = pool; // Export the pool connection for use in other files


// updated 21st sept 8.41pm 
const mysql = require('mysql2/promise');
require('dotenv').config();

// Create a connection pool
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
  waitForConnections: true,
  connectionLimit: 100,
  queueLimit: 0
});

// Test the connection with async/await
async function testConnection() {
  try {
    const connection = await pool.getConnection();
    console.log('Successfully connected to the MySQL database.');
    connection.release(); // Release the connection back to the pool
  } catch (error) {
    console.error('Error connecting to the MySQL database:', error.message);
  }
}

testConnection(); // Call the test function to check connection

module.exports = pool; // Export the pool to use in other parts of your application

//updated code 24th sept 2.22pm
// db.js
// const mysql = require('mysql2/promi');
// require('dotenv').config();
// const connection = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',      // Replace with your MySQL username
//     password: 'AMVishwas2001',  // Replace with your MySQL password
//     database: 'authectication'   // Replace with your database name
// });

// // Connect to the database
// connection.connect((err) => {
//     if (err) {
//         console.error('Error connecting to the database:', err);
//         return;
//     }
//     console.log('Connected to the database.');
// });

// // Export the connection
// module.exports = connection;
