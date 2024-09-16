const PROTO_PATH = './restaurant.proto';

// var grpc = require("grpc");
var grpc = require('@grpc/grpc-js');
var protoLoader = require('@grpc/proto-loader');
const mongoose = require('mongoose');

const { v4: uuidv4 } = require('uuid');

var packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  arrays: true,
});

var restaurantProto = grpc.loadPackageDefinition(packageDefinition);

mongoose.connect(
  'mongodb+srv://punyaphatsura:4rGn0tjjQfA3EPam@whatifproject.blg0e.mongodb.net/sa_grpc',
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB');
});

// Step 3: Define Mongoose Schema and Model
const menuSchema = new mongoose.Schema({
  name: String,
  price: Number,
});

const MenuItem = mongoose.model('MenuItem', menuSchema);

const server = new grpc.Server();

server.addService(restaurantProto.RestaurantService.service, {
  // Get all menu items from MongoDB
  getAllMenu: async (_, callback) => {
    try {
      const menu = await MenuItem.find();
      callback(null, { menu });
    } catch (err) {
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error fetching menu',
      });
    }
  },

  // Get a specific menu item by id
  get: async (call, callback) => {
    try {
      const menuItem = await MenuItem.findById(call.request.id);
      if (menuItem) {
        callback(null, menuItem);
      } else {
        callback({
          code: grpc.status.NOT_FOUND,
          details: 'Not Found',
        });
      }
    } catch (err) {
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error fetching menu item',
      });
    }
  },

  // Insert a new menu item into MongoDB
  insert: async (call, callback) => {
    try {
      const menuItem = new MenuItem(call.request);
      await menuItem.save();
      callback(null, menuItem);
    } catch (err) {
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error inserting menu item',
      });
    }
  },

  // Update an existing menu item by id
  update: async (call, callback) => {
    try {
      const menuItem = await MenuItem.findByIdAndUpdate(
        call.request.id,
        {
          name: call.request.name,
          price: call.request.price,
        },
        { new: true }
      );

      if (menuItem) {
        callback(null, menuItem);
      } else {
        callback({
          code: grpc.status.NOT_FOUND,
          details: 'Not Found',
        });
      }
    } catch (err) {
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error updating menu item',
      });
    }
  },

  // Remove a menu item by id
  remove: async (call, callback) => {
    try {
      const result = await MenuItem.findByIdAndDelete(call.request.id);
      if (result) {
        callback(null, {});
      } else {
        callback({
          code: grpc.status.NOT_FOUND,
          details: 'Not Found',
        });
      }
    } catch (err) {
      callback({
        code: grpc.status.INTERNAL,
        details: 'Error removing menu item',
      });
    }
  },
});

// Start the gRPC server
server.bindAsync(
  '127.0.0.1:30043',
  grpc.ServerCredentials.createInsecure(),
  () => {
    server.start();
  }
);

console.log('Server running at http://127.0.0.1:30043');
