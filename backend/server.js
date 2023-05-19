const express = require('express');
const sql = require('./sql')
// Constants
const PORT = 3000;

// App
const app = express();
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.get('/', (req, res) => {
    res.json({ name: "Tuan" })
})

app.get('/api', (req, res) => {
    sql.conSQL("Select * from Login", (recordset) => {
        res.send(recordset)
    })
})

app.post('/api', (req, res) => {
    var name = req.body.name;
    sql.conSQL(`INSERT INTO Login Values ("${name}")`, (recordset) => {
        res.send(recordset)
    })
})

app.delete('/api', (req, res) => {
    var name = req.body.name;
    sql.conSQL(`DELETE FROM Login Where Name = ${name}`, (recordset) => {
        res.send(recordset)
    })
})

app.listen(process.env.PORT || PORT, () => {
    // console.log(`Running in port ${process.env.PORT}`);
});
