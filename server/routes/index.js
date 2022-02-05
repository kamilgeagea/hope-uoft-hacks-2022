const express = require('express')
const actions = require('./../src/actions')
const router = express.Router();

// Get Articles
router.get('/posts', actions.scrapper)

// Add User
router.post('/register', actions.addNew)

// Login
router.post('/login', actions.authenticate)

// Get Profile
router.get('/profile', actions.getProfile)

// Update Profile
router.put('/updateprofile', actions.updateProfile)

// Add Comment
router.post('/comment', actions.addComment)

// Delete Comment
router.delete('/comment', actions.deleteComment)

// Like Comment
router.put('/like', actions.likeComment)

module.exports = router