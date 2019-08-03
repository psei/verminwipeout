'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites:{
    bullet: {
      animationName: 'weapon3-bullet',
      imageSrc: '/images/shots/shot-3.png',
      frames: [1, 2, 3, 4, 5, 6, 7, 8],
      width: 152,
      height: 110,
      frameRate: 15
    }
  },
  reloadTime: 200,
  fireLimit: 1,
  bulletSpeed: 420,
  range: 200,
  causesDamagePoints: 3,
});
