module.exports = function(app) {
  app.get('/', function (req, res) {
    res.render('index', { title: 'Frank Express' });
  });

app.get('/a', function (req, res) {
  res.send('hello,world!');
});
};

