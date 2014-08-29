var tcpServer;
var net = require('net');
var sockets = [];
var portNum = 8001;
var ioClient = require('socket.io-client')('http://localhost:8088');

ioClient.on('connect', function() {
	tcpServer = net.createServer(function(socket){
		sockets.push(socket); // ���Ϲ迭�� ������ ���� ��ü �ֱ�
		console.log('Socket server started on port ' + portNum + ', good luck~');
		console.log("socket pushzzzz");
		socket.on('error', function(err){
			// ���� �߻� ��.. �̰� ���� ��� ����˴ϴ�.
			console.log(err.stack);
		});
		socket.on('data', function (msg_sent) {
//			console.log(msg_sent); // ���� (byte[] ����)
//			console.log(msg_sent.toString()); // ��Ʈ������ ��ȯ
			console.log(msg_sent.toString('base64')); // base64���ڵ����� ��ȯ
			msg_sent.toString('base64');
			// Ŭ���̾�Ʈ���� ������ �޼���
			socket.write('ok');
			ioClient.emit('img', {
				img: msg_sent.toString('base64')
			});
		});
		socket.on('end', function () {
			// ������ ������ �� �迭���� �ش� ���� �����
			var i = sockets.indexOf(socket);
			sockets.splice(i, 1);
			console.log('Disconnected');
		});
	});
	tcpServer.listen(portNum);
});