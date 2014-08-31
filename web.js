var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var fs = require('fs');

app.get('/', function(req, res){
	fs.readFile('Client.html',function(error, data){
		res.writeHead(200,{'Content-Type' : 'text/html'});
		res.end(data);
	});
});
http.listen(8088);

require('./socket_test')(io);  //파일 불러오기
require('./tcpServer');
