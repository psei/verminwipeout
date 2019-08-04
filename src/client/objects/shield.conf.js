'use strict';

var config = require('../baseConfig');
module.exports = config({
  sprites: {
    shield: {
      animationName: 'ship-shield',
      imageSrc: '/images/ship/ship-shield.png',
      frames: [1, 2, 3, 4, 5, 6, 7],
      width: 214,
      height: 200,
      frameRate: 15
    },
  },
});
