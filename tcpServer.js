var tcpServer;
var net = require('net');
var sockets = [];
var portNum = 8001;
var buff = new Buffer(0, 'binary');
var ioClient = require('socket.io-client')('http://localhost:8088');

ioClient.on('connect', function() {
	tcpServer = net.createServer(function(socket){
		sockets.push(socket); // 소켓배열에 접속한 소켓 객체 넣기
		socket.on('error', function(err){
			// 에러 발생 시.. 이거 빼면 노드 종료됩니다.
			console.log(err.stack);
		});
		socket.on('data', function (msg_sent) {
			//msg_sent.toString('base64');
			socket.write('ok');
			buff = Buffer.concat([buff, new Buffer(msg_sent, 'binary')]);
		});
		socket.on('end', function () {
			// 접속이 끊겼을 때 배열에서 해당 소켓 지우기
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