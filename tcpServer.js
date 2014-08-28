var tcpServer;
var net = require('net');
var sockets = [];
tcpServer = net.createServer(function(socket){
	sockets.push(socket);
	console.log('Java client connected to this nodeServer');
	socket.on('error', function(err){
		console.log(err.stack);
	});
//	socket.on('data', function(data){
//		console.log(data); // 원본 (byte[] 형식)
//		console.log(data.toString()); // 스트링으로 변환
//		console.log(data.toString('base64'));
//		socket.write(data.toString('base64'));
//	});
//	socket.on('end', function(){
//		var i = sockets.indexOf(socket);
//		sockets.splice(i, 1);
//		console.log('Disconnected');
//	});
});
	var io = require('socket.io').listen(tcpServer);
	io.sockets.on('connection', function(socket) {
		console.log('Java client connected to socket.io');
		socket.emit('toClient',{msg:'Welcom ! '});
		socket.on('fromclient',function(data){
			   console.log(data);
		       socket.broadcast.emit('toclient',data); // 자신을 제외하고 다른 클라이언트에게 보냄
		       socket.emit('toclient',data); // 해당 클라이언트에게만 보냄. 다른 클라이언트에 보낼려면?
		       console.log('Message from client :'+data.msg);
		   })
	});
	
	tcpServer.listen(1338,'127.0.0.1',function(){
	console.log('Server running at http://127.0.0.1:1338/');
});

