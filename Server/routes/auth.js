const express =require('express');
const User = require('../models/user');
const bcryptjs=require("bcryptjs")
const authRouter =express.Router();


authRouter.post("/api/signup", async function(req, res){
    try {
        const {name, email, password}  =  req.body;

 const existingUser= await  User.findOne({
    email
 });

 if(existingUser){
    return res.status(400).json( {msg:"Password oder Email ist falsch, bzw. existiert schon"})
 }

const hashedPassword= await bcryptjs.hash(password, 8)

 let user=new User({
    email, password: hashedPassword, name,
 })
 user=await user.save();
 res.json(user);
    } catch (error) {
        res.status(500).json({error:e.message})
    }
 

})

module.exports=authRouter;