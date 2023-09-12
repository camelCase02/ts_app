const express =require('express');
const User = require('../models/user');
const bcryptjs=require("bcryptjs")
const authRouter =express.Router();
const jwt =require("jsonwebtoken")


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
        res.status(500).json({error:e.message+"etwas went wrong, check your data"})
    }
  
 

})

authRouter.post('/api/signin', async(req, res)=>{
   try {
      const {email, password}=req.body
      const user=await User.findOne({email})
      if(!user){
         return res.status(400).json({msg: "Email, Password oder beides ist falsch..."})
      }

  const isMatched= await    bcryptjs.compare(password, user.password)
if(!isMatched){
   return res.status(400).json({msg: "Email, Password oder beides ist falsch..."})
}
const token= jwt.sign({id: user._id}, "passwordKey")
res.json({token, ...user._doc})


   } catch (e) {
      res.status(500).json({error:e.message})
      
   }
})
//login route 



module.exports=authRouter;