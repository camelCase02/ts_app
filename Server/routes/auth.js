const express = require('express');
const User = require('../models/user');
const bcryptjs = require("bcryptjs")
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require('../middleware/auth');


authRouter.post("/api/signup", async function (req, res) {
   try {
      const { name, email, password, type } = req.body;
      console.log(name);
      console.log(type);

      const existingUser = await User.findOne({
         email
      });

      if (existingUser) {
         return res.status(400).json({ msg: "User already exists. Please try with different email" })
      }

      const hashedPassword = await bcryptjs.hash(password, 8)

      let user = new User({
         email, password: hashedPassword, name,
         type: type,
      })
      user = await user.save();
      console.log(user);
      res.json(user);
   } catch (error) {
      console.log(error.message);
      console.log(error);
      res.status(500).json({ error: error.message + " Something went wrong" })
   }



})

authRouter.post('/api/signin', async (req, res) => {
   try {
      const { email, password } = req.body
      const user = await User.findOne({ email })
      if (!user) {
         return res.status(400).json({ msg: "Please check Email or Password" })
      }

      const isMatched = await bcryptjs.compare(password, user.password)
      if (!isMatched) {
         return res.status(400).json({ msg: "Please check Email or Password" })
      }
      const token = jwt.sign({ id: user._id }, "passwordKey")
      res.json({ token, ...user._doc })


   } catch (e) {
      res.status(500).json({ error: e.message })

   }
})
//login route 


authRouter.post('/tokenIsValid', async (req, res) => {
   
   try {
      const token = req.header('x-auth-token')
      if (!token) return res.json(false)
      const verifed = jwt.verify(token, "passwordKey")
      if (!verifed) return res.json(false)
      const user = await User.findById(verifed.id)
      if (!user) return res.json(false)
      res.json(true)
   } catch (e) {
      res.status(500).json({ error: e.message })

   }
})

// get user data

authRouter.get('/', auth, async (req, res) => {
   const user = await User.findById(req.user)
   res.json({ ...user._doc, token: req.token })
})

authRouter.get('/api/logout', async (req, res) => {
   try {

   } catch (e) {
      res.status(500).json({ error: e.message })

   }
})


module.exports = authRouter;