'use strict';

var invokeMap = require('lodash/invokeMap');

var configs = [
  require('../objects/player.conf'),
  require('../objects/debris.conf'),
  require('../level1.conf.js')
];

module.exports = function (game) {
  return {
    preload: function () {
      game.load.image('weapon-bullet', '/images/Shots/shot_0_0.png');
      invokeMap(configs, 'loadImages', game);
    },
    create: function () {
      game.stage.backgroundColor = '#F0F0F0';
      game.state.clearCurrentState();
      game.state.start('play');
    }
  };
};
