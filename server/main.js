const cors = require("cors");
const express = require('express');
const connectDB = require('./src/database/db')
const bodyParser = require('body-parser')
const PORT = process.env.PORT || 3000
const routes = require('./routes/index')
const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(routes)
app.listen(PORT, console.log(`Server running on port: ${PORT}`));