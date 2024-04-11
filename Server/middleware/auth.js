

const jwt = require('jsonwebtoken')
const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token')
        if (!token) return res.status(401).json({ msg: "access denied no auth token" })
        const verifed = jwt.verify(token, "passwordKey")
        if (!verifed) return res.status(401).json({ msg: "Token verification failed, autorization denied" })

        req.user = verifed.id
        req.token = token
        next()
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
}

module.exports = auth