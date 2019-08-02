'use strict';

var config = require('../baseConfig');
module.exports = config({
  images: {
    ship: '/images/ship/ship.png',
    shipLeft: '/images/ship/ship-left.png',
    shipRight: '/images/ship/ship-right.png',

    healthBar: 'images/interface/healthbar-static.png',
    healthAlert: 'images/interface/healthbar-alert.gif',

    gameOver: 'images/interface/gameOver.jpg',

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
    splatter6: 'images/splatter/splatter-6.png',
    splatter7: 'images/splatter/splatter-7.png',
    splatter8: 'images/splatter/splatter-8.png',
    splatter9: 'images/splatter/splatter-9.png',
    splatter10: 'images/splatter/splatter-10.png',
    splatter11: 'images/splatter/splatter-11.png',
    splatter12: 'images/splatter/splatter-12.png',
    splatter13: 'images/splatter/splatter-13.png',
    splatter14: 'images/splatter/splatter-14.png',
    splatter15: 'images/splatter/splatter-15.png',
    splatter16: 'images/splatter/splatter-16.png',
    splatter17: 'images/splatter/splatter-17.png',
    splatter18: 'images/splatter/splatter-18.png',
    splatter19: 'images/splatter/splatter-19.png',
    splatter20: 'images/splatter/splatter-20.png',
    splatter21: 'images/splatter/splatter-21.png',
    splatter22: 'images/splatter/splatter-22.png',
    splatter23: 'images/splatter/splatter-23.png',
    splatter24: 'images/splatter/splatter-24.png',
    splatter25: 'images/splatter/splatter-25.png',
    splatter26: 'images/splatter/splatter-26.png',
    splatter27: 'images/splatter/splatter-27.png',
    splatter28: 'images/splatter/splatter-28.png',
    splatter29: 'images/splatter/splatter-29.png',
    splatter30: 'images/splatter/splatter-30.png',
    splatter31: 'images/splatter/splatter-31.png',
    splatter32: 'images/splatter/splatter-32.png',
    splatter33: 'images/splatter/splatter-33.png',
    splatter34: 'images/splatter/splatter-34.png',
    splatter35: 'images/splatter/splatter-35.png',

    wiperClean: 'images/interface/wiper-1.png',
    wiperDirty: 'images/interface/wiper-2.png',
  },
  sprites: {
    shield: {
      animationName: 'ship-shield',
      imageSrc: '/images/ship/ship-shield.png',
      frames: [1, 2, 3, 4, 5, 6, 7],
      width: 214,
      height: 200,
      frameRate: 15
    },
    death: {
      animationName: 'ship-death',
      imageSrc: '/images/ship/ship-death.png',
      frames: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
      width: 500,
      height: 500,
      frameRate: 5
    },
    shipThrustLeftLow: {
      animationName: 'ship-left-sprites',
      imageSrc: '/images/ship/ship-left-sprites.png',
      frames: [0, 1],
      width: 376,
      height: 830,
      frameRate: 15
    },
    shipThrustLeftMid: {
      animationName: 'ship-left-sprites',
      imageSrc: '/images/ship/ship-left-sprites.png',
      frames: [2, 3],
      width: 376,
      height: 830,
      frameRate: 15
    },
    shipThrustRightLow: {
      animationName: 'ship-right-sprites',
      imageSrc: '/images/ship/ship-right-sprites.png',
      frames: [0, 1],
      width: 376,
      height: 830,
      frameRate: 15
    },
    shipThrustRightMid: {
      animationName: 'ship-right-sprites',
      imageSrc: '/images/ship/ship-right-sprites.png',
      frames: [2, 3],
      width: 376,
      height: 830,
      frameRate: 15
    },
    shipThrustCenterLow: {
      animationName: 'ship-center-sprites',
      imageSrc: '/images/ship/ship-center-sprites.png',
      frames: [0, 1],
      width: 188,
      height: 415,
      frameRate: 15
    },
    shipThrustCenterMid: {
      animationName: 'ship-center-sprites',
      imageSrc: '/images/ship/ship-center-sprites.png',
      frames: [2, 3],
      width: 188,
      height: 415,
      frameRate: 15
    }
  },
  width: 78,
  height: 90,
  speed: 6,

  healthPaddingX: 33,
  healthPaddingY: 73, // keep in sync with level.conf (healthBgPaddingY + 16)
});
