'use strict';

const express = require('express');
const path = require('path');
const PORT = 8080;

var app = express();

app.use(express.static(path.join(__dirname, '../public'), {
  maxAge: 10000
}));

app.listen(PORT, function () {
  console.info(`app listening on port ${PORT}`);
});