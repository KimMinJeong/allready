module.exports = function(io)//외부에서 접근 가능
{
	io.on('connection', function(socket){
		socket.on('error',function(err){
			console.log('error reading data'+ err);
		});
		socket.on('start', function(data){
			console.log('start');
		});
		socket.on('end', function(data){
			console.log('end');
		});
		socket.on('img', function(data){
			var draw=data.img;
			//console.log(draw);
			socket.broadcast.emit('sendImg', draw);
		});
	});
};