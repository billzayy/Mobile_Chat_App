const mysql = require('mysql');

function conSQL(strSQL, cb) {
    const connectDB = mysql.createConnection({
        host: 'localhost',
        port: "22989",
        user: 'root',
        password: 'mysql',
        database: 'project_3'
    })

    connectDB.connect(function (err) {
        if (err) throw err;
        // console.log('Connected to the MySQL server.');
        connectDB.query(strSQL, function (err, result) {
            if (err) throw (err);
            cb(result)
        })
    });
}

module.exports = {
    conSQL: conSQL,
};