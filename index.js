const express = require('express');
const app = express();
const port = 3000;

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
});
app.get('/', function (req, res) {
    res.json('Hello World')
});
app.get('/version', function (req, res) {
    res.json('1.0.0')
});