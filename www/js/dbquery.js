document.addEventListener('deviceready', function(){
	$('#submit').on('click', function(){
		$('form').each(function(){submit;	});
	});
	//alert('ready');
	//var mysql      = require('http`');
	//var connection = mysql.createConnection({   host     : '172.30.1.49',   user     : 'root',   password : 'user',   database : 'jproject'});
	/*connection.connect();

	function addUser( id, pw, name, tel, email){
		var insertQuery = "insert into user values ( ?, ?, ?, ?, ?)";
		alert('adduser called');
		connection.query( insertQuery, [ id, pw, name, tel, email], function( error, result, fields){
			if(error) throw error;
		});
	}


	$('#submit').on('click', function(){
		alert("clcik");
		var inputValues= [];
		var index =0;
		$('input').each(function(){
			inputValues[index] = $(this).val();
			index ++;
		});
		addUser(inputValues[0], inputValues[1], inputValues[2], inputValues[3], inputValues[4]);
	});*/
});
