const express = require('express');
const User = require('../models/user');
const cartRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require('../middleware/auth');

cartRouter.post("/api/cart/add", auth, async function (req, res) {
    try {
        const { id } = req.body;
        let user = await User.findById(req.user);
        await user.addToCart(id);
        user = await user.save();
        res.json(user);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})
cartRouter.post("/api/cart/remove", auth, async function (req, res) {
    try {
        const { id } = req.body;
        let user = await User.findById(req.user);
        await user.removeFromCart(id);
        user = await user.save();
        res.json(user);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})
cartRouter.get("/api/cart", auth, async function (req, res) {
    try {
        const user = await User.findById(req.user);
        res.json(user);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})

module.exports = cartRouter;