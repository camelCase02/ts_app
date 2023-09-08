// IMPORT from Packages
const express = require('express');
const { env_db } = require('../.env.js');
  // Ensure the path './env' points correctly to the env.js file

const mongoose = require("mongoose");
require('dotenv').config();  // Load environment variables from .env file

// Import from other files
const authRouter = require("./routes/auth");

// INIT
const Port = 3000;
const DB = env_db;
 // Assuming you named it DB_STRING in your .env file
const app = express();

// middleware
app.use(express.json())
app.use(authRouter);

// CLIENT -> SERVER-> CLIENT

// Create an API
// GET, PUT, POST, DELETE, UPDATE -> CRUD 
//http://youripdaddress/

// connection
mongoose.connect(DB).then(() => {
    console.log("Database mongoose connection successful");
}).catch(e => {
    console.log(e);
});

app.listen(Port, function() {
    console.log("port is connected! juhuuuuuu");
});
