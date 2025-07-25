const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

// Test the connection immediately to ensure DB credentials are valid
(async () => {
  try {
    const connection = await pool.getConnection();
    console.log("✅ MySQL connection established successfully.");
    connection.release();
  } catch (error) {
    console.error("❌ Unable to connect to MySQL database:", error.message);
  }
})();

module.exports = pool;
