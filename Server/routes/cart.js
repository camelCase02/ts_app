const express = require('express');
const User = require('../models/user');
const Order = require('../models/order');
const cartRouter = express.Router();
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
cartRouter.delete("/api/cart/clear", auth, async function (req, res) {
    try {
        let user = await User.findById(req.user);
        await user.clearCart();
        user = await user.save();
        res.json(user);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})
cartRouter.post("/api/order", async function (req, res) {
    try {
        const { productId, quantity, orderedAt, status, totalPrice, orderedBy } = req.body;

        const order = new Order({
            productId,
            quantity,
            orderedAt,
            status,
            totalPrice,
            orderedBy
        });
        await order.save();

        res.status(201).json({ success: true, message: "Order placed successfully", order });
    }
    catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message })
    }
})

module.exports = cartRouter;