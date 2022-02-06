const mongoose = require('mongoose')
const Schema = mongoose.Schema

const commentSchema = new Schema({
    title: {
        type: String,
        trim: true,
        required: "Title Required"
    },
    date: Date,
    text: String,
    userId: mongoose.Schema.Types.ObjectId,
    likes: Number
})

module.exports = mongoose.model('Comment', commentSchema)