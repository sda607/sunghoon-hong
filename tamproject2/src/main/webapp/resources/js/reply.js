
 console.log("Reply Module....");
 
 var replyService = (function(){
 
 	function add(reply, callback, error){
 		consol.log("reply.....");
 	
 
 	$.ajax({
 	type :  'post',
 	data : JSON.stringify(reply),
 	contentType : "application/json; charset=utf-8",
 	success : function(result, status, xhr) {
 		if(callback) {
 			callback(result);
 		}
 	},
 	erorr : function(xhr, status, er) {
 		if(error){
 		error(er);
 			}
	 	}
	 })
 }
 	return {
 		add:add
	};
 })();