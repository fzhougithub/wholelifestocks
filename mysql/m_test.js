var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    database : 's',
    user     : 'stock',
    password : 'wholelifestocks',
});

connection.connect(function(err) {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }

    console.log('Connected as id ' + connection.threadId);
});

connection.query('SELECT id from test, function (error, results, fields) {
    if (error)
        throw error;

    results.forEach(result => {
        console.log("Id is " + result);
    });
});

connection.end();
