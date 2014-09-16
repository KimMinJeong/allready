var tcpServer;
var net = require('net');
var sockets = [];
var portNum = 8001;
var buff = new Buffer(0, 'binary');
var ioClient = require('socket.io-client')('http://localhost:8088');

ioClient.on('connect', function() {
	tcpServer = net.createServer(function(socket){
		sockets.push(socket); // ���Ϲ迭�� ������ ���� ��ü �ֱ�
		socket.on('error', function(err){
			// ���� �߻� ��.. �̰� ���� ��� ����˴ϴ�.
			console.log(err.stack);
		});
		socket.on('data', function (msg_sent) {
			//msg_sent.toString('base64');
			socket.write('ok');
			buff = Buffer.concat([buff, new Buffer(msg_sent, 'binary')]);
		});
		socket.on('end', function () {
			// ������ ������ �� �迭���� �ش� ���� �����
			var i = sockets.indexOf(socket);
			sockets.splice(i, 1);
			console.log('Disconnected');
			
			ioClient.emit('img', {
				img: buff.toString('base64')
			});
		});
	});
	tcpServer.listen(portNum);
});