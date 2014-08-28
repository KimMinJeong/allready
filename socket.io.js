var io = require('socket.io').listen(1338,"localhost");
 
io.sockets.on('connection', function(socket) {
	socket.on('join', function(data){
		socket.broadcast.emit('join', socket_id, data);
	});
	
	socket.on('disconnect', function(){
		socket.broadcast.emit('close', socket.id);
	});
});