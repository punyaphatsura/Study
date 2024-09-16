const mongoose = require('mongoose');

// Define the schema for Menu items
const MenuSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
});

// Create the model based on the schema
const MenuItem = mongoose.model('MenuItem', MenuSchema);

module.exports = MenuItem;
