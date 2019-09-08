'use strict';

var config = require('../../baseConfig');

module.exports = config({
  name: 'jizzler',
  spriteName: 'verminEnemies',
  spriteFolder: 'enemies/level1/2-jizzler',
  frameInfo: {
    fly: {
      count: 3,
      rate: 5,
    },
    death: {
      count: 9,
      rate: 12,
    },
    attack: {
      count: 16,
      rate: 12,
    },
  },
  body: {
    offsetX: 500,
    offsetY: 400,
    width: 150,
    height: 340,
  },
  scaleFactor: 0.3,
  chanceToShootPerSecondInPercent: 0,
  causesDamagePoints: 15,
  health: 3,
  givesSplatter: false,
  givesDna: true,
});
