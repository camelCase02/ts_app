const express =require('express');
const User = require('../models/user');
const bcryptjs=require("bcryptjs")
const authRouter =express.Router();
const jwt =require("jsonwebtoken");
const auth = require('../middleware/auth');


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


authRouter.post('/tokenIsValid', async(req, res)=>{
   try {
      
 const token=req.header('x-auth-token')
 if(!token) return res.json(false)
const verifed= jwt.verify(token, "passwordKey" )
if(!verifed)return res.json(false)
const user= await User.findById(verifed.id)
if(!user)return res.json(false)
res.json(true)

 


   } catch (e) {
      res.status(500).json({error:e.message})
      
   }
})

// get user data

authRouter.get('/', auth, async(req, res)=>{
   const user=await User.findById(req.user)
   res.json({...user._doc, token:req.token})
})


module.exports=authRouter;