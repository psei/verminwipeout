'use strict';

var config = require('../baseConfig');
module.exports = config({
  images: {
    ship: '/images/ship/ship.png',
    shipLeft: '/images/ship/ship-left.png',
    shipRight: '/images/ship/ship-right.png',

    healthBar: 'images/interface/healthbar-static.png',
    healthAlert: 'images/interface/healthbar-alert.gif',

    deathMessage1: 'images/titles/death-message-1.png',
    deathMessage2: 'images/titles/death-message-2.png',
    deathMessage3: 'images/titles/death-message-3.png',
    deathMessage4: 'images/titles/death-message-4.png',
    deathMessage5: 'images/titles/death-message-5.png',
    deathMessage6: 'images/titles/death-message-6.png',
    deathMessage7: 'images/titles/death-message-7.png',
    deathMessage8: 'images/titles/death-message-8.png',
    deathMessage9: 'images/titles/death-message-9.png',
    deathMessage10: 'images/titles/death-message-10.png',
    deathMessage11: 'images/titles/death-message-11.png',
    deathMessage12: 'images/titles/death-message-12.png',
    deathMessage13: 'images/titles/death-message-13.png',

    splatter1: 'images/splatter/splatter-1.png',
    splatter2: 'images/splatter/splatter-2.png',
    splatter3: 'images/splatter/splatter-3.png',
    splatter4: 'images/splatter/splatter-4.png',
    splatter5: 'images/splatter/splatter-5.png',

    wiper: 'images/interface/wiper-2.png',
  },
  sprites: {
    shield: {
      animationName: 'ship-shield',
      imageSrc: '/images/ship/ship-shield.png',
      frames: [1, 2, 3, 4, 5, 6, 7],
      width: 214,
      height: 200,
      frameRate: 15
    }
  },
  width: 78,
  height: 90,
  speed: 6,

  healthPaddingX: 33,
  healthPaddingY: 73, // keep in sync with level.conf (healthBgPaddingY + 16)
});
