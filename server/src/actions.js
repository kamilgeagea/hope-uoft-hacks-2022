var config = require('./database/dbConfig')
var User = require('./../models/user')
var Comment = require('./../models/article')
var jwt = require('jwt-simple')
var config = require('./database/dbConfig')
var request = require('request');
const axios = require('axios').default;
const NewsAPI = require('newsapi');
const newsapi = new NewsAPI('e7a837f92cf24c1f85b35a28b7eb263b');

const functions = {
    scrapper: function (req, res) {
        try{
            let output = ''
            newsapi.v2.topHeadlines({
                category: 'business',
                language: 'en',
            }).then(response => {
                output+=JSON.stringify(response)
                newsapi.v2.topHeadlines({
                    category: 'science',
                    language: 'en',
                }).then(response1 => {
                    output+=JSON.stringify(response1)
                    newsapi.v2.topHeadlines({
                        category: 'sports',
                        language: 'en',
                    }).then(response2 => {
                        output+=JSON.stringify(response2)
                        newsapi.v2.topHeadlines({
                            category: 'entertainment',
                            language: 'en',
                        }).then(response3 => {
                            output+=JSON.stringify(response3)
                            res.json(output)
                        });
                    });
                });
            });
            
        }
        catch(error){
            res.send({
                success: false,
                msg: 'Unable to fetch information this time! Try again'
            })
        }
    },
    addNew: function(req,res){
        if(!req.body.username || !req.body.password || !req.body.email){
            res.json({
                success: false,
                mag: "Enter all Field"
            })
        }
        else{
            var newUser = User({
                username: req.body.username,
                password: req.body.password,
                email: req.body.email
            })
            newUser.save(function(err, newUser){
                if(err){
                    res.json({
                        success: false,
                        msg: 'Failed to Save'
                    })
                }
                else{
                    res.json({
                        success: true,
                        msg: 'Successfully Added',
                    })
                }
            })
        }
    },
    authenticate: function(req,res){
        User.findOne({
            username: req.body.username
        }, 
        function(err, user){
            if(err){
                res.json({
                    success: false,
                    msg: "Authentication Failed"
                });
            }
            if(!user){
                res.status(403).send({success: false, msg: "User not Found"});
            }
            else{
                user.comparePassword(req.body.password, function(err, isMatch){
                    if(!err&&isMatch){
                        var token = jwt.encode(user, config.secret)
                        res.json({
                            success: true,
                            token: token
                        })
                    }
                    else{
                        res.status(403).send({
                            success: false,
                            msg: "Authentication Failed! Wrong Password"
                        })
                    }
                })
            }
        })
    },
    getProfile: function (req, res) {
        if(req.headers.authorization){
            try{
                var token = req.headers.authorization.split(' ')[0]
                var decodetoken = jwt.decode(token ,config.secret)
                User.findOne({
                    _id: decodetoken
                }, function(err, user){
                    if(err){
                        res.json({
                            success: false,
                            msg: 'User Not Found'
                        })
                    }
                    else{
                        res.json({
                            success: true,
                            msg: 'Successfully Fetched',
                            user
                        });
                    }
                })
            } catch(err){
                res.status(400).json({ message: "Invalid token" })
            }
        }
        else{
            res.send({
                success: false,
                msg: "No Headers"
            })
        }
    },
    updateProfile: function(req, res){
        if(req.headers.authorization){
            try{
                var token = req.headers.authorization.split(' ')[0]
                var decodetoken = jwt.decode(token ,config.secret)
                if(!req.body.username || !req.body.password || !req.body.email){
                    res.json({
                        success: false,
                        mag: "Enter all Field"
                    })
                }
                else{
                    var newUser = User({
                        username: req.body.username,
                        password: req.body.password,
                        email: req.body.email
                    })
                    newUser.save(function(err, newUser){
                        if(err){
                            res.json({
                                success: false,
                                msg: 'Failed to Save'
                            })
                        }
                        else{
                            res.json({
                                success: true,
                                msg: 'Successfully Added',
                            })
                        }
                    })
                }
            }
            catch(err){
                res.json({
                    success: false,
                    msg: 'Data not Found'
                })
            }
        }
        else{
            res.json({
                success: false,
                msg: "No Headers"
            })
        }
    },
    addComment: function (req, res) {
        if(req.headers.authorization){
            try{
                var token = req.headers.authorization.split(' ')[0]
                var decodetoken = jwt.decode(token ,config.secret)
                var newComment = Comment({
                    user: decodetoken._id,
                    title: req.title,
                    date: req.date,
                    text: req.text,
                    likes: 0
                })
                newComment.save(function(err, newComment){
                    if(err){
                        res.json({
                            success: false,
                            msg: 'Failed to Save'
                        })
                    }
                    else{
                        res.json({
                            success: true,
                            msg: 'Successfully Saved',
                        })
                    }
                })
            } catch(err){
                res.status(400).json({ message: "Invalid token" })
            }
        }
        else{
            res.send({
                success: false,
                msg: "No Headers"
            })
        }
    },
    deleteComment: function (req, res) {
        if(req.headers.authorization){
            try{
                var token = req.headers.authorization.split(' ')[0]
                var decodetoken = jwt.decode(token ,config.secret)
                Comment.deleteOne({
                    _id: req.body.id
                })
            } catch(err){
                res.status(400).json({ message: "Invalid token" })
            }
        }
        else{
            res.send({
                success: false,
                msg: "No Headers"
            })
        }
    },
    likeComment: function (req, res) {
        if(req.headers.authorization){
            try{
                var token = req.headers.authorization.split(' ')[0]
                var decodetoken = jwt.decode(token ,config.secret)
                Comment.findOne({
                    _id: req.body.id
                }, function(err, comment){
                    if(err){
                        res.json({
                            success: false,
                            msg: 'Comment Not Found'
                        })
                    }
                    else{
                        comment.like = comment.like+1;
                        res.json({
                            success: true,
                            msg: 'Successfully Updates'
                        })
                    }
                    
                })
            } catch(err){
                res.status(400).json({ message: "Invalid token" })
            }
        }
        else{
            res.send({
                success: false,
                msg: "No Headers"
            })
        }
    }
}

module.exports = functions