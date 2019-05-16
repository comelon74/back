var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'dvwa'
});

/*connection.connect();

connection.query('select * from users', function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

connection.end();*/
module.exports = connection;