function groupAPI(app, io, sql) {
    app.get('/api/group/get-all', (req, res) => {
        sql.conSQL(`Select * from GroupChat`, recordset => {
            res.send(recordset);
        })
    })
}

module.exports = groupAPI;