const express = require('express');
const axios = require('axios');
const router = express.Router();

// Payment verification route
router.post('/verify', async (req, res) => {
    const { payment_id, order_id, amount } = req.body;

    try {
        // Example: Replace with actual API to verify payment
        const verificationResponse = await axios.post(
            `https://api.razorpay.com/v1/payments/${payment_id}/capture`,
            { amount: amount },  // Amount should match the order's amount in paise
            {
                auth: {
                    username: 'rzp_live_aU1E3UhKc7RY0I', // Replace with Razorpay Key ID
                    password: 'HwvVhctiCKGA6iDxHHnE6sFc'  // Replace with Razorpay Secret
                }
            }
        );

        if (verificationResponse.data.status === 'captured') {
            return res.json({ success: true, message: 'Payment captured successfully' });
        } else {
            return res.status(400).json({ success: false, message: 'Payment verification failed' });
        }
    } catch (error) {
        console.error('Error verifying payment:', error);
        res.status(500).json({ success: false, message: 'Server error' });
    }
});

module.exports = router;
