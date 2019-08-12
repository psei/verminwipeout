'use strict';

var config = require('../../baseConfig');

module.exports = config({
  name: 'ghumbo',
  spriteName: 'verminEnemies',
  spriteFolder: 'enemies/level1/1-ghumbo',
  frameInfo: {
    fly: {
      count: 0,
      rate: 1,
    },
    death: {
      count: 9,
      rate: 12,
    },
    attack: {
      count: 0,
      rate: 12,
    },
  },
  body: {
    offsetX: 0,
    offsetY: 0,
    width: 269,
    height: 340,
  },
  scaleFactor: 0.4,
  chanceToShootPerSecondInPercent: 0,
  causesDamagePoints: 15,
  health: 6,
  givesSplatter: true,
});
