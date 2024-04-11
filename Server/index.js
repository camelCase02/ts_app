// IMPORT from Packages
const express = require('express');
const cors = require('cors');
//const { env_db } = require('config.env.js');
  // Ensure the path './env' points correctly to the env.js file

const mongoose = require("mongoose");
require('dotenv').config();  // Load environment variables from .env file

// Import from other files
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");


// INIT
const Port = 3000;
const DB = 'mongodb+srv://abhkum75:Abhay1393@atlascluster.vhfyayp.mongodb.net/?retryWrites=true&w=majority&appName=AtlasCluster';
// const DB = 'mongodb://localhost:27017/ts-app-local-db';
console.log(DB);
console.log("DB");
 // Assuming you named it DB_STRING in your .env file
const app = express();

// middleware
app.use(express.json())
app.use(authRouter);
app.use(adminRouter);
app.use(cors());

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
