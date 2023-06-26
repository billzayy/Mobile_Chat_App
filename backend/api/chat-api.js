function chatAPI(app, io, sql) { 
    io.on('connection', (socket) => {
        socket.on('send-chat-message', (message) => {
            sql.conSQL(`INSERT INTO Message(Sendby, Messages, Time, Type) VALUES(${message.id}, '${message.message}', '${Date.now()}',${1})`, recordset => {})
            socket.broadcast.emit('chat-message', message)
        })
    })

    app.get('/api/chat/get-all', (req, res) => {
        sql.conSQL('SELECT * FROM Message', (recordset) => {
            res.send(recordset)
        })
    })

    app.get('/api/chat/delete-chat', (req, res) => {
        const idMessage = req.body.id;
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