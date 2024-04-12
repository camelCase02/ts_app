const mongoose = require("mongoose")

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re)
            },
            message: "Bitte eine korrekte Email Adresse eintragen"
        },

    },
    password: {
        required: true,
        type: String,
        validate: {
            validator: (value) => {

                return value.length > 6;
            },
            message: "passwort zu kurz"
        },

    },
    address: {
        type: String,
        default: "",
    },
    type: {
        type: String,
        default: "user"
    },
    cart: {
        required: false,
        type: [
            {
                productId: {
                    type: mongoose.Schema.Types.ObjectId,
                    ref: 'Product',
                    required: true,
                },
                quantity: {
                    type: Number,
                    required: true,
                    default: 1,
                }
            },
        ],
        default: [],
    },
})

userSchema.methods.addToCart = async function (productId) {
    try {
        // Check if the product already exists in the cart
        const existingProductIndex = this.cart.findIndex(item => item.productId.equals(productId));

        if (existingProductIndex !== -1) {
            // Product already exists, update the quantity
            this.cart[existingProductIndex].quantity += 1;
        } else {
            this.cart.push({ productId: productId, quantity: 1 });
        }

        await this.save(); // Save the user document after updating the cart
        return { success: true, message: "Product added to cart successfully" };
    } catch (error) {
        return { success: false, message: error.message };
    }
};

userSchema.methods.removeFromCart = async function (productId) {
    try {
        // Check if the product exists in the cart
        const existingProductIndex = this.cart.findIndex(item => item.productId.equals(productId));

        if (existingProductIndex !== -1) {
            this.cart[existingProductIndex].quantity -= 1;
            if (this.cart[existingProductIndex].quantity <= 0) {
                this.cart.splice(existingProductIndex, 1);
            }
        }

        await this.save();
        return { success: true, message: "Product removed from cart successfully" };
    } catch (error) {
        return { success: false, message: error.message };
    }
};
userSchema.methods.clearCart = async function () {
    try {
        // clear the cart
        this.cart = [];
        await this.save();
        return { success: true, message: "cart successfully cleared!" };
    } catch (error) {
        return { success: false, message: error.message };
    }
};

const User = mongoose.model("User", userSchema);

module.exports = User;