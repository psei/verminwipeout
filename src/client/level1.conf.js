'use strict';

var config = require('./baseConfig');

module.exports = config({
  images: {
    background: '/images/backgrounds/background.jpg'
  },
  backgroundWidth: 800,
  backgroundHeight: 1997,
  backgroundSpeed: 4,

  waves: [{
    type: 'enemy',
    spawnAt: 250,
    objects: [{
      time: 5000, x: [200, 300, 200, 350, 650, 650], y: [-100, 0, 100, 200, 300, 900]
    }, {
      time: 5000, x: [350, 400, 300, 450, 750, 750], y: [-100, 0, 100, 200, 300, 900]
    }, {
      time: 5000, x: [550, 500, 400, 550, 850, 850], y: [-100, 0, 100, 200, 300, 900]
    }, {
      time: 5000, x: [700, 600, 500, 650, 950, 950], y: [-100, 0, 100, 200, 300, 900]
    }]
  }, {
    type: 'debris',
    spawnAt: 400,
    objects: [
      { x: 940, y: -220 },
      { x: 300, y: -230 },
      { x: 710, y: -260 },
      { x: 340, y: -270 }
    ]
  }, {
    type: 'debris',
    spawnAt: 800,
    objects: [
      { x: 300, y: -130 },
      { x: 940, y: -320 },
      { x: 340, y: -370 },
      { x: 710, y: -460 }
    ]
  }]
});
