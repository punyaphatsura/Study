#!/usr/bin/env node

var amqp = require("amqplib/callback_api");

// Get types from command line arguments
var args = process.argv.slice(2);

amqp.connect("amqp://localhost", function (error0, connection) {
  if (error0) {
    throw error0;
  }
  connection.createChannel(function (error1, channel) {
    if (error1) {
      throw error1;
    }

    var exchange = "order_exchange"; // The topic exchange
    channel.assertExchange(exchange, "topic", {
      durable: true,
    });

    channel.prefetch(1);

    // Assert a new queue for this consumer
    channel.assertQueue(
      "",
      {
        exclusive: true, // Create a new exclusive, auto-delete queue for the consumer
        durable: false, // Create a new durable queue
        autoDelete: true, // Automatically deleted when the consumer disconnects
      },
      function (error2, q) {
        if (error2) {
          throw error2;
        }

        console.log(" [*] Waiting for messages. To exit press CTRL+C");

        // If no types are specified, subscribe to all orders
        if (args.length === 0) {
          console.log(" [*] Subscribing to all order types (order.#)");
          channel.bindQueue(q.queue, exchange, "order.#"); // Bind to all topics with "order.#"
        } else {
          // Subscribe to specified types (e.g., order.food, order.drink)
          args.forEach(function (type) {
            var routingKey = `order.${type}`;
            console.log(` [*] Subscribing to ${routingKey}`);
            channel.bindQueue(q.queue, exchange, routingKey);
          });
        }

        // Consume messages from the queue
        channel.consume(
          q.queue,
          function (msg) {
            if (msg.content) {
              const order = JSON.parse(msg.content.toString());
              const quantity = order.quantity || 1; // Default to 1 if quantity is missing

              console.log(" [x] Received '%s'", msg.content.toString());
              console.log(" [x] Parsed Order:", order);

              // Random sleep between 0 and 0.5 seconds * quantity
              const sleepTime = Math.random() * 0.5 * 1000 * quantity;

              // Delay the acknowledgment
              setTimeout(() => {
                console.log(
                  ` [x] Done processing order after ${sleepTime.toFixed(2)} ms`
                );
                channel.ack(msg);
              }, sleepTime);
            }
          },
          {
            noAck: false,
          }
        );
      }
    );
  });
});
