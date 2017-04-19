'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites: {
    enemy: {
      animationName: 'enemy-1-fly',
      imageSrc: '/images/enemies/enemy-1.png',
      frames: [1, 2],
      width: 232,
      height: 290,
      frameRate: 5
    },
    death: {
      animationName: 'enemy-1-death',
      imageSrc: '/images/enemies/enemy-1-death.png',
      frames: [1],
      width: 11824,
      height: 721,
      frameRate: 12
    }
  }
});
