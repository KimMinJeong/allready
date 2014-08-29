var tcpServer;
var net = require('net');
var sockets = [];
var portNum = 8001;
var ioClient = require('socket.io-client')('http://localhost:8088');

ioClient.on('connect', function() {
	tcpServer = net.createServer(function(socket){
		sockets.push(socket); // 소켓배열에 접속한 소켓 객체 넣기
		console.log('Socket server started on port ' + portNum + ', good luck~');
		console.log("socket pushzzzz");
		socket.on('error', function(err){
			// 에러 발생 시.. 이거 빼면 노드 종료됩니다.
			console.log(err.stack);
		});
		socket.on('data', function (msg_sent) {
//			console.log(msg_sent); // 원본 (byte[] 형식)
//			console.log(msg_sent.toString()); // 스트링으로 변환
			console.log(msg_sent.toString('base64')); // base64인코딩으로 변환
			msg_sent.toString('base64');
			// 클라이언트에게 전달할 메세지
			socket.write('ok');
			ioClient.emit('img', {
				img: msg_sent.toString('base64')
			});
		});
		socket.on('end', function () {
			// 접속이 끊겼을 때 배열에서 해당 소켓 지우기
			var i = sockets.indexOf(socket);
			sockets.splice(i, 1);
			console.log('Disconnected');
		});
	});
	tcpServer.listen(portNum);
});