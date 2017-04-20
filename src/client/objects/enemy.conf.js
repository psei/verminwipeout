'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites: {
    enemy: {
      animationName: 'enemy-1-fly',
      imageSrc: '/images/enemies/enemy-1.png',
      frames: [1, 2],
      width: 80,
      height: 100,
      frameRate: 5
    },
    death: {
      animationName: 'enemy-1-death',
      imageSrc: '/images/enemies/enemy-1-death.png',
      frames: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
      width: 410,
      height: 300,
      frameRate: 12
    }
  }
});
