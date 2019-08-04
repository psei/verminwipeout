'use strict';

var config = require('../baseConfig');
module.exports = config({
  images: {
    ship: '/images/ship/ship.png',
    shipLeft: '/images/ship/ship-left.png',
    shipRight: '/images/ship/ship-right.png',

    gameOver: 'images/interface/gameOver.jpg',
    gameOverShipLife: 'images/interface/gameOverShipLife.png',
    gameOverShipDeath: 'images/interface/gameOverShipDeath.png',
  },
  width: 78,
  height: 90,
  speed: 6,
});
