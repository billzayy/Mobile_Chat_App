// Import file
const loginAPI = require('./api/login-api');

// Library
const express = require('express');
const sql = require('./sql')

// App
const app = express();
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.get('/', (req, res) => {
    res.json({ "Do an": "Software-Project-3" })
})

loginAPI(app, sql);

app.listen(27680, () => {
    // console.log(`Running in port ${process.env.PORT}`);
});
