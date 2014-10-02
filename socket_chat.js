module.exports = function(io)//외부에서 접근 가능
{
	var sessionusername;
    var usernames = {};
    var numUser=0;
    var user;
    
    io.sockets.on('connection', function(socket){
    	socket.on('user_id', function(username){
    		console.log("ID :"+username);
    		sessionusername = username;
    		socket.emit('userId', username);
    		});
		
		socket.on('chat message', function(data){
			console.log("MEssaging ID"+sessionusername);
			io.sockets.emit('chat message',{
				username: sessionusername,
				message: data
			});
		});
		
		socket.on('disconnect', function(){
			socket.broadcast.emit('close', socket.id);
		});
	});
};