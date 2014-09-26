var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var fs = require('fs');

app.get('/', function(req, res){
	fs.readFile('index.html',function(error, data){
		res.writeHead(200,{'Content-Type' : 'text/html'});
		res.end(data);
	});
});

http.listen(3000, function(){
	console.log('listening on *:3000');
});
require('./socket_chat')(io);  //파일 불러오기
