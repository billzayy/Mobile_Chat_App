function chatAPI(app, io, sql) { 
    io.on('connection', (socket) => {
        socket.on('send-chat-message', (message) => {
            console.log(message)
            socket.broadcast.emit('chat-message', message)
        })
    })

    app.get('/api/chat/get-all', (req, res) => {
        sql.conSQL('SELECT * FROM Message', (recordset) => {
            res.send(recordset)
        })
    })
}

module.exports = chatAPI;