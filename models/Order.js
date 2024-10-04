const { Sequelize, DataTypes } = require('sequelize');
const sequelize = new Sequelize('authectication', 'root', 'AMVishwas2001', {
  host: 'localhost',
  dialect: 'mysql',
});

const Order = sequelize.define('Order', {
    user_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    products: {
      type: Sequelize.JSON,
      allowNull: false,
    },
    total_amount: {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: false,
    },
    payment_method: {
      type: Sequelize.ENUM('COD', 'UPI'),
      allowNull: false,
    },
    address: {
      type:  Sequelize.TEXT,
      allowNull: false,
    },
    status: {
      type: Sequelize.ENUM('pending', 'completed', 'cancelled'),
      defaultValue: 'pending',
    },  razorpay_payment_id: {
      type: Sequelize.STRING, // Razorpay payment ID is usually alphanumeric
      allowNull: true, // Optional: if the payment can be recorded after order creation
    }
  }, {
    timestamps: true,
    createdAt: 'created_at', // Use snake_case for created_at
    updatedAt: 'updated_at', // Automatically adds createdAt and updatedAt fields
  });
  

module.exports = Order;
