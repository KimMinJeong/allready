module.exports = function(io)//외부에서 접근 가능
{
	io.on('connection', function(socket){
		socket.on('error',function(err){
			console.log('error reading data'+ err);
		});
		socket.on('start', function(data){
			console.log('start');
		});
		socket.on('image', function(data){
			socket.broadcast.emit('image', data.img);
		});
		socket.on('end', function(data){
			console.log('end');
		});
	});
};