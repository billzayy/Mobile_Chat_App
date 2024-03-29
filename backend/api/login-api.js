const md5 = require('md5');

function loginAPI(app, sql) {
    app.get('/api/get-user', (req, res) => {
        sql.conSQL("Select * from Login", (recordset) => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": recordset
                })
            }
            catch (err) {
                res.status(400).send({
                    "message": "Failure",
                    "data": err
                })
            }
        })
    })

    app.get('/api/get-specific-user', (req, res) => {
        var idUser = req.query.idUser;
        sql.conSQL(`Select * from Login Where Id_User = ${idUser}`, recordset => {
            try {
                if (recordset[0] === undefined) {
                    res.status(200).send({
                        "message": "Success",
                        "data": `Can't find user ${idUser} in db`
                    })
                }
                else {
                    res.status(200).send({
                        "message": "Success",
                        "data": recordset[0]
                    })
                }
            } catch (error) {
                res.status(400).send({
                    "message": "Failure",
                    "data": err
                })
            }
        })
    })

    app.get('/api/login/', (req, res) => {
        var email = req.query.email;
        var password = md5(req.query.password);
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
                    "data": "Your input is not email or password. Please try again !"
                })
            }
        })
    })

    app.post('/api/create-user', (req, res) => {
        var password = md5(req.body.password);
        var email = req.body.email;
        var fullName = req.body.fullName;
        var phone = req.body.phone;
        var status = "online";
        sql.conSQL(`select Login.Email from Login Where Login.Email = '${email}'`, (recordset) => {
            if (recordset[0] != undefined) {
                res.status(404).send({
                    "message": "Your email has already existed. Please try again !"
                })
            }
            else {
                sql.conSQL(`INSERT INTO Login (Password, Email, Fullname, Phones, Status) Values ('${password}','${email}', '${fullName}','${phone}','${status}')`, (recordset) => {
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
            }
        })
    })

    app.put('/api/modify-user', (req, res) => {
        var idUser = req.body.Id_User;
        var password = md5(req.body.Password);
        var email = req.body.Email;
        var fullName = req.body.FullName;
        var phone = req.body.Phone;
        var picture = req.body.Pictures;
        var city = req.body.City;
        var status = "online";
        sql.conSQL(`UPDATE Login Set 
                        Password = '${password}', Email = '${email}', 
                        Fullname = '${fullName}', Phones = '${phone}',
                        Pictures = '${picture}', City = '${city}', Status = '${status}'
                        Where Id_User = ${idUser}`, recordset => {
            try { 
                res.status(201).send({
                    "message": "Success",
                    "data": "Update Successful"
                });
            }
            catch (err){
                res.status(400).send({
                    "message": "Failure",
                    "data": "Cannot update User's Information"
                })
            }
        })
    })
    
    app.delete('/api/delete-user', (req, res) => {
        var name = req.body.name;
        sql.conSQL(`DELETE FROM Login Where Fullname = ${name}`, (recordset) => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data":"Delete Successful !!!"
                })
            } catch (error) {
                res.status(400).send({
                    "message": "Failure",
                    "data":"Fail to Delete Account ! Try again later !"
                })
            }
        })
    })
    
    app.get('/api/search', (req, res) => {
        var name = req.query.name;
        sql.conSQL(`SELECT * FROM Login Where Fullname Like '%${name}%'`, recordset => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": recordset
                })
            } catch (error) {
                res.status(404).send({
                    "message": "Failure",
                    "data":"Not Found"
                })
                res.status(400).send({
                    "message": "Failure",
                    "data":"Bad request!"
                })
            }
        })
    })
}

module.exports = loginAPI;