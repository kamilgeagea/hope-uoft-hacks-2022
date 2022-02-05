var config = require('./database/dbConfig')

const functions = {
    scrapper: function (req, res) {
        return res.send({hello: "world"});
    },
    addNew: function(req,res){
        return res.send({hello: "world"});
    },
    authenticate: function(req,res){
        return res.send({hello: "world"});
    },
    getProfile: function (req, res) {
        return res.send({hello: "world"});
    },
    updateProfile: function(req, res){
        return res.send({hello: "world"});
    },
    addComment: function (req, res) {
        return res.send({hello: "world"});
    },
    deleteComment: function (req, res) {
        return res.send({hello: "world"});
    },
    likeComment: function (req, res) {
        return res.send({hello: "world"});
    }
}

module.exports = functions