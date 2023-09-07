

// IMPORT from Packages
const express =require('express');

// Import from other fiels

const authRouter = require("./routes/auth")
// INIT
const Port=3000;

const app= express();
// middleware
app.use(authRouter);
// CLIENT -> SERVER-> CLIENT






// Create an API
// GET, PUT, POST, DELETE, UPDATE -> CRUD 
//http://youripdaddress/ 



app.listen(Port, function(){
console.log("port is connected! juhuuuuuu")
})