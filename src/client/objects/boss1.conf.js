'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites: {
    enemy: {
      animationName: 'boss-1-fly',
      imageSrc: '/images/enemies/boss-1/boss-1-fly-1.png',
      frames: [0],
      width: 362,
      height: 320,
      frameRate: 1
    },
    attack: {
      animationName: 'boss-1-attack',
      imageSrc: '/images/enemies/boss-1/boss-1-fly-1.png',
      frames: [0],
      width: 362,
      height: 320,
      frameRate: 1
    }
  },
  chanceToShootPerSecondInPercent: 25,
  causesDamagePoints: 15,
  health: 100,
  givesSplatter: true,
});
