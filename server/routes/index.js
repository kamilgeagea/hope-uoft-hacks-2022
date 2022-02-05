const express = require('express')
const actions = require('./../src/actions')
const authMiddleware = require('./../src/auth-middleware');
const router = express.Router();

// Get Articles
router.get('/posts', authMiddleware, actions.scrapper)

// Add User
router.post('/register', actions.addNew)

// Login
router.post('/login', actions.authenticate)

// Get Profile
router.get('/profile', authMiddleware, actions.getProfile)

// Update Profile
router.put('/updateprofile', authMiddleware, actions.updateProfile)

// Add Comment
router.post('/comment', authMiddleware, actions.addComment)

// Delete Comment
router.delete('/comment',authMiddleware,  actions.deleteComment)

// Like Comment
router.post('/like', authMiddleware, actions.likeComment)

module.exports = router