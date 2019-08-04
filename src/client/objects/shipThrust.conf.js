'use strict';

var config = require('../baseConfig');
module.exports = config({
  sprites: {
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
});
