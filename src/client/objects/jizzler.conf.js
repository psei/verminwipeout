'use strict';

var config = require('../baseConfig');

module.exports = config({
  sprites: {
    enemy: {
      animationName: 'jizzler-fly',
      imageSrc: '/images/enemies/jizzler/fly.png',
      frames: [0, 1],
      width: 34,
      height: 98,
      frameRate: 5
    },
    death: {
      animationName: 'jizzler-death',
      imageSrc: '/images/enemies/cutterfly/death.png',
      frames: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      width: 333,
      height: 244,
      frameRate: 12
    },
    attack: {
      animationName: 'jizzler-attack',
      imageSrc: '/images/enemies/jizzler/attack.png',
      frames: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      width: 34,
      height: 98,
      frameRate: 10
    }
  },
  chanceToShootPerSecondInPercent: 15,
  causesDamagePoints: 50,
  givesSplatter: false,
});
