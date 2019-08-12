'use strict';

var config = require('../baseConfig');

//** PULSE BLASTER **//

module.exports = config({
  sound: '/audio/fx/shot-1.wav',
  images: {
    bullet: '/images/shots/shot-1.png'
  },
  reloadTime: 80,
  fireLimit: 70,
  bulletSpeed: 1000,
  causesDamagePoints: 2,
});
