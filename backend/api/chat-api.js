function chatAPI(io) { 
    io.on('connection', (socket) => {
        socket.on('send-chat-message', (message) => {
            console.log(message)
            socket.broadcast.emit('chat-message')
        })
    })
}

module.exports = chatAPI;