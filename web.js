var app = require('express')();
var app2 = require('express')();
var http = require('http').Server(app);
var http2 = require('http').Server(app2);

var io = require('socket.io')(http);
var io2= require('socket.io')(http2);

var fs = require('fs');

app.get('/cctv01', function(req, res){
	fs.readFile('Client.html',function(error, data){
		res.writeHead(200,{'Content-Type' : 'text/html'});
		res.end(data);
	});
});

http.listen(8000);

app2.get('/cctv02', function(req, res){
	fs.readFile('Client02.html',function(error, data){
		res.writeHead(200,{'Content-Type' : 'text/html'});
		res.end(data);
	});
});

http2.listen(8001);

require('./socket_cctv')(io);  //파일 불러오기
require('./socket_cctv02')(io2);
