module.exports = function(io)//�ܺο��� ���� ����
{
	io.on('connection', function(socket){
		
		socket.on('user_id', function(data){
			console.log(data+'connected');
			socket.broadcast.emit('userId', data);
		});
		
		socket.on('chat message', function(msg){
			console.log(msg);
			socket.broadcast.emit('chat message', msg);
		});	
	});
};