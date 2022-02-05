const admin=require('firebase-admin');
var serviceAccount = require('./hope-417c1-firebase-adminsdk-1bj0p-6606ac7c35.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://hope-417c1.firebaseio.com",
    authDomain: "hope-417c1.firebaseapp.com",
});

module.exports = admin