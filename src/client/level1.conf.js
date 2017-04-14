'use strict';

var config = require('./baseConfig');
module.exports = config({
  images: {
    background: '/images/background/background.jpg'
  },
  backgroundWidth: 2000,
  backgroundHeight: 4992,
  backgroundSpeed: 4,

  waves: [{
    type: 'debris',
    spawnAt: 400,
    objects: [{
      y: -230,
      x: 300
    }, {
      y: -260,
      x: 710
    }, {
      y: -220,
      x: 940
    }, {
      y: -270,
      x: 340
    }]
  }, {
    type: 'debris',
    spawnAt: 800,
    objects: [{
      y: -130,
      x: 300
    }, {
      y: -460,
      x: 710
    }, {
      y: -320,
      x: 940
    }, {
      y: -370,
      x: 340
    }]
  }]
});
