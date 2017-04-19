'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites: {
    debris: {
      animationName: 'debris-2-fly',
      imageSrc: '/images/debris/debris-2.png',
      frames: [1, 2, 3],
      width: 40,
      height: 43,
      frameRate: 15
    },
    debrisInverted: {
      animationName: 'debris-2-fly-inverted',
      imageSrc: '/images/debris/debris-2.png',
      frames: [3, 2, 1],
      width: 40,
      height: 43,
      frameRate: 5
    },
    explode: {
      animationName: 'debris-2-explode',
      imageSrc: '/images/debris/debris-2-death.png',
      frames: [1, 2, 3, 4, 5],
      width: 240,
      height: 200,
      frameRate: 12
    }
  },
  speeds: [1.2, 1.5, 1.8]
});
