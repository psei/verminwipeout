'use strict';

var config = require('../../baseConfig');

module.exports = config({
  name: 'cutterfly',
  spriteName: 'verminEnemies',
  spriteFolder: 'enemies/level1/0-cutterfly',
  frameInfo: {
    fly: {
      count: 1,
      rate: 5,
    },
    death: {
      count: 11,
      rate: 12,
    },
    attack: {
      count: 1,
      rate: 12,
    },
  },
  body: {
    offsetX: 0,
    offsetY: 0,
    width: 232,
    height: 280,
  },
  scaleFactor: 0.4,
  chanceToShootPerSecondInPercent: 0,
  causesDamagePoints: 15,
  health: 3,
  givesSplatter: true,
  givesDna: true,
});
