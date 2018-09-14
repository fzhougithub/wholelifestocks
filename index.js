var express = require('express');
var app = express();
 
//setting middleware
app.use(express.static('www'));

app.use('/html', express.static(__dirname + '/html'));
app.use('/cgi-bin',express.static(__dirname + '/cgi-bin')); //Serves resources from www folder
 
var server = app.listen(5050);

var http = require('http'),
    fs = require('fs');


fs.readFile('./www/html/index.html', function (err, html) {
    if (err) {
        throw err; 
    }       
    http.createServer(function(request, response) {  
        response.writeHeader(200, {"Content-Type": "text/html"});  
        response.write(html);  
        response.end();  
    }).listen(8080);
});
