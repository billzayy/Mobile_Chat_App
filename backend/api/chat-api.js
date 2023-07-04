function chatAPI(app, io, sql) { 
    io.on('connection', (socket) => {
        socket.on('send-chat-message', (message) => {
            sql.conSQL(`INSERT INTO Message(Sendby, Id_Group,Messages, Time, Type) VALUES(${message.Sendby},${message.IdGroup}, '${message.Messages}', '${message.Time}',${message.Type})`, recordset => { })
            socket.broadcast.emit('chat-message', message)
        })
    })

    app.get('/api/chat/get-all', (req, res) => {
        var idGroup = req.query.idGroup;
        sql.conSQL(`SELECT * FROM Message Where Id_Group = ${idGroup}`, (recordset) => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": recordset
                })
            } catch (error) {
                res.status(400).send({
                    "message": "Failure",
                    "data":"Error to get chat"
                })
            }
        })
    })

    app.delete('/api/chat/delete-chat', (req, res) => {
        var idMessage = req.body.idMessage;
        sql.conSQL(`DELETE FROM Message where Id_Message = ${idMessage}`, recordset => {
            try {
                res.status(200).send({
                    "message": "Success",
                    "data": "Delete Successful"
                })
            } catch (error) {
                res.send({
                    "message": "Fail",
                    "data": "Fail to Delete Chat"
                })
            }
        })
    })
}

module.exports = chatAPI;