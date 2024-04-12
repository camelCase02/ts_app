const mongoose = require("mongoose")

const orderSchema = mongoose.Schema({
    productId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Product',
        required: true
    },
    quantity: {
        type: Number,
        required: true
    },
    userId: {
        type: String,
        required: true
    },
    orderedBy: {
        type: String,
        required: true
    },
    orderedAt: {
        type: Date,
        required: true,
        default: Date.now
    },
    status: {
        type: String,
        required: true,
        default: 'Pending'
    },
    totalPrice: {
        type: Number,
        required: true
    }
});

const Order = mongoose.model("Order", orderSchema);

module.exports = Order;