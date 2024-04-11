const express = require('express');
const User = require('../models/user');
const Product = require('../models/product');
const adminRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require('../middleware/auth');

adminRouter.post("/admin/add-product", auth, async function (req, res) {
    try {
        const { name, description, quantity, price, category, images } = req.body;
        let product = new Product({
            name: name,
            description: description,
            category: category,
            images: images,
            price: price,
            userId: req.user,
            quantity: quantity,
        })
        product = await product.save();
        res.json(product);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})
adminRouter.get("/admin", auth, async function (req, res) {
    try {
        let products = await Product.find({ userId: req.user });
        res.json(products);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})


module.exports = adminRouter;