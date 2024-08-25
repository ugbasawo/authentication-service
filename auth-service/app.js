const express = require('express');
const Sequelize = require('sequelize'); // Note: This still works, but it’s often imported with destructuring.
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth');

// Load environment variables
dotenv.config();

const app = express();

// Middleware
app.use(express.json());

// Check if environment variables are set
if (!process.env.DB_NAME || !process.env.DB_USER || !process.env.DB_PASSWORD || !process.env.DB_HOST) {
  console.error('Environment variables not set');
  process.exit(1); // Exit the process if required environment variables are missing
}

// MySQL Connection
const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

sequelize.authenticate()
  .then(() => console.log('MySQL Connected'))
  .catch(err => {
    console.error('Unable to connect to MySQL:', err);
    process.exit(1); // Exit the process if the database connection fails
  });

// Routes
app.use('/api/auth', authRoutes);

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

