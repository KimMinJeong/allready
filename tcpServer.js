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
//		console.log(data); // ���� (byte[] ����)
//		console.log(data.toString()); // ��Ʈ������ ��ȯ
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
		       socket.broadcast.emit('toclient',data); // �ڽ��� �����ϰ� �ٸ� Ŭ���̾�Ʈ���� ����
		       socket.emit('toclient',data); // �ش� Ŭ���̾�Ʈ���Ը� ����. �ٸ� Ŭ���̾�Ʈ�� ��������?
		       console.log('Message from client :'+data.msg);
		   })
	});
	
	tcpServer.listen(1338,'127.0.0.1',function(){
	console.log('Server running at http://127.0.0.1:1338/');
});

