const mongoose = require("mongoose")

const productSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true
    },
    userId: {
        required: true,
        type: String,
        trim: true
    },
    description: {
        required: false,
        type: String,
        trim: true
    },
    price: {
        required: true,
        type: Number,
        trim: true
    },
    quantity: {
        required: true,
        type: Number,
        default: 1,
    },
    images: {
        required: false,
        type: [String],
        default: [],
    },
    category: {
        required: true,
        type: String,
        trim: true
    }
});


const Product = mongoose.model("Product", productSchema);

module.exports = Product;