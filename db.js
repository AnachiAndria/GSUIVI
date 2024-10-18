// CONNECTION BASE 

require('dotenv').config();
const mysql = require('mysql2');

// Create a MySQL connection pool
const db = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

// Export the connection pool to be used in other files
module.exports = db;