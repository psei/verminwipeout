'use strict';

var config = require('../baseConfig');

module.exports = config({
  sound: '/audio/fx/shot-1.wav',
  images: {
    bullet: '/images/shots/shot-1.png'
  },
  reloadTime: 200,
  fireLimit: 30,
  bulletSpeed: 720
});
