'use strict';

var config = require('../../baseConfig');

module.exports = config({
  name: 'sawjaw',
  spriteName: 'verminEnemies',
  spriteFolder: 'enemies/level1/3-sawjaw',
  frameInfo: {
    fly: {
      count: 0,
      rate: 1,
    },
    death: {
      count: 7,
      rate: 12,
    },
    attack: {
      count: 0,
      rate: 12,
    },
  },
  body: {
    offsetX: 430,
    offsetY: 400,
    width: 175,
    height: 210,
  },
  scaleFactor: 0.3,
  chanceToShootPerSecondInPercent: 0,
  causesDamagePoints: 20,
  health: 10,
  givesSplatter: true,
});
