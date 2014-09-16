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
http.listen(8000);

require('./socket_test')(io);  //파일 불러오기
//require('./tcpServer');

//var sys = require('sys'),
//http = require('http'),
//
//
//http.createServer(function (req, res){
//var proxy = new httpProxy;
//proxy.init(req, res);
//proxy.proxyRequest('localhost', '9000', req, res);
//}).listen(8000);
//
//http.createServer(function (req, res){
//res.writeHead(200, {'Content-Type': 'text/plain'});
//res.write('request successfully proxied!' + 'n' + JSON.stringify(req.headers, true, 2));
//res.end();
//}).listen(9000);