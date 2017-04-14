'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites: {
    debris: {
      animationName: 'debris-0-fly',
      imageSrc: '/images/debris/debris-0-fly-small.png',
      frames: [1, 2, 3, 4, 5, 6],
      width: 40,
      height: 40,
      frameRate: 15
    },
    debrisInverted: {
      animationName: 'debris-0-fly-inverted',
      imageSrc: '/images/debris/debris-0-fly-small.png',
      frames: [6, 5, 4, 3, 2, 1],
      width: 40,
      height: 40,
      frameRate: 5
    }
  },
  speeds: [1.2, 1.5, 1.8]
});
