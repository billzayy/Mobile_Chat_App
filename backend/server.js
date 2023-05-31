const express = require('express');
const sql = require('./sql')

// App
const app = express();
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.get('/', (req, res) => {
    res.json({ "Do an": "Software-Project-3" })
})

app.get('/api/get-login', (req, res) => {
    sql.conSQL("Select * from Login", (recordset) => {
        try {
            res.status(200).send({
                "message": "Success",
                "data": recordset
            })
        }
        catch(err) { 
            res.status(400).send(err)
        }
    })
})

app.post('/api/create-user', (req, res) => {
    var userName = req.body.userName;
    var password = req.body.password;
    var email = req.body.email;
    var fullName = req.body.fullName;
    var phone = req.body.phone;
    var status = "online";
    sql.conSQL(`INSERT INTO Login (Username, Password, Email, Fullname, Phones, Status) Values ('${userName}','${password}','${email}', '${phone}','${fullName}','${status}')`, (recordset) => {
        try {
            res.status(201).send({
                "message": "Success Create User Account",
            })
        }
        catch (err) {
            res.status(400).send({
                "message": "Fail to create Account"
            })
         }
    })
})

app.delete('/api', (req, res) => {
    var name = req.body.name;
    sql.conSQL(`DELETE FROM Login Where Name = ${name}`, (recordset) => {
        res.send(recordset)
    })
})

app.listen(8080, () => {
    // console.log(`Running in port ${process.env.PORT}`);
});
