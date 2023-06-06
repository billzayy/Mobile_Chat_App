const express = require('express');
const sql = require('./sql')

// App
const app = express();
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.get('/', (req, res) => {
    res.json({ "Do an": "Software-Project-3" })
})

app.get('/api/get-user', (req, res) => {
    sql.conSQL("Select * from Login", (recordset) => {
        try {
            res.status(200).send({
                "message": "Success",
                "data": recordset
            })
        }
        catch(err) { 
            res.status(400).send({
                "message": "Failure",
                "data":err
            }) 
        }
    })
})

app.get('/api/login/', (req, res) => {
    var email = req.query.email;
    var password = req.query.password;
    sql.conSQL(`Select * from Login Where Email= '${email}' AND Password = '${password}'`, (recordset) => {
        try {
            if (recordset[0].Email == email || recordset[0].Password == password) {
                res.status(200).send({
                    "message": "Success",
                    "data": recordset[0]
                });
            }
        }
        catch (err) {
            res.status(400).send({
                "message": "Failure",
                "data": "Your email or password is incorrect. Please try again later !"
            })
            res.status(500).send({
                "message": "Failure",
                "data" : "Your input is not email or password. Please try again !"
            })
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
                "message": "Success",
            })
        }
        catch (err) {
            res.status(400).send({
                "message": "Failure"
            })
         }
    })
})


app.delete('/api/delete-user', (req, res) => {
    var name = req.body.name;
    sql.conSQL(`DELETE FROM Login Where Name = ${name}`, (recordset) => {
        res.send(recordset)
    })
})

app.listen(8080, () => {
    // console.log(`Running in port ${process.env.PORT}`);
});
