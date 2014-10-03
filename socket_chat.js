var sessionUserName = [];

module.exports = function(io)//외부에서 접근 가능
{
    io.sockets.on('connection', function(socket){
    	socket.on('setMyUserId', function(data){
    		sessionUserName.push({
        		sid : socket.id, 
        		userId : data
        	});
    	});
 
		socket.on('chat message', function(data){
			console.log(sessionUserName);
			io.sockets.emit('chat message',{
				username: data.userId,
				message: data.msg
			});
		});
		
		socket.on('disconnect', function(data){
			for(var i = 0 ; i < sessionUserName.length ; i++) {
				if(sessionUserName[i].sid === socket.id) {
					console.log(sessionUserName[i]);
					sessionUserName.slice(i);
				}
			}
		 });
	});
};