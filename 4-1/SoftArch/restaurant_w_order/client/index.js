const client = require('./client');

const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', (req, res) => {
  client.getAllMenu(null, (err, data) => {
    if (!err) {
      res.render('menu', {
        results: data.menu,
      });
    }
  });
});

var amqp = require('amqplib/callback_api');

app.post('/placeorder', (req, res) => {
  //const updateMenuItem = {
  var orderItem = {
    id: req.body.id,
    type: req.body.type,
    name: req.body.name,
    quantity: req.body.quantity,
  };

  // Send the order msg to RabbitMQ
  amqp.connect('amqp://localhost', function (error0, connection) {
    if (error0) {
      throw error0;
    }
    connection.createChannel(function (error1, channel) {
      if (error1) {
        throw error1;
      }
      //   var queue = "order_queue";
      var exchange = 'order_exchange'; // Name of the topic exchange
      var routingKey = `order.${req.body.type}`; // Dynamic routing key based on order type

      //var msg = process.argv.slice(2).join(' ') || "Hello World!";

      channel.assertExchange(exchange, 'topic', {
        durable: true,
      });

      // Send the order to the exchange using the routing key
      channel.publish(
        exchange,
        routingKey,
        Buffer.from(JSON.stringify(orderItem)),
        {
          persistent: true,
        }
      );

      console.log(
        " [x] Sent order '%s' with routing key '%s'",
        orderItem.name,
        routingKey
      );
    });
  });
});
//console.log("update Item %s %s %d",updateMenuItem.id, req.body.name, req.body.quantity);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('Server running at port %d', PORT);
});

//var data = [{
//   name: '********',
//   company: 'JP Morgan',
//   designation: 'Senior Application Engineer'
//}];
