const express = require('express');
const User = require('../models/user');
const Product = require('../models/product');
const productRouter = express.Router();
const jwt = require("jsonwebtoken");


productRouter.get("/api/products", async function (req, res) {
    try {
        const products = await Product.find({}).limit(6);
        res.json(products);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})
productRouter.get("/api/products/category", async function (req, res) {
    try {
        const products = await Product.find({ category: req.query.category }).limit(6);
        res.json(products);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})

productRouter.get("/api/products/id", async function (req, res) {
    try {
        const product = await Product.findById(req.query.id);
        res.json(product);
    }
    catch (e) {
        res.status(500).json({ error: e.message + " Something went wrong" })
    }
})






module.exports = productRouter;