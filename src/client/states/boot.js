'use strict';

var invokeMap = require('lodash/invokeMap');

var configs = [
  require('../objects/player.conf'),
  require('../objects/debris1.conf'),
  require('../objects/debris2.conf'),
  require('../objects/cutterfly.conf'),
  require('../objects/jizzler.conf'),
  require('../level1.conf.js'),
  require('../objects/weapon1.conf.js'),
  require('../objects/weapon2.conf.js'),
  require('../objects/weapon3.conf.js')
];

module.exports = function (game) {
  return {
    preload: function () {
      invokeMap(configs, 'loadMedia', game);
      game.load.audio('music-1-intro', '/audio/music/music-1-intro.wav');
      game.load.audio('music-1-loop', '/audio/music/music-1-loop.wav');
      game.load.audio('boss-intro', '/audio/music/boss-intro.wav');
      game.load.audio('boss-loop', '/audio/music/boss-loop.wav');
    },
    create: function () {
      game.stage.backgroundColor = '#F0F0F0';
      game.state.clearCurrentState();
      game.state.start('play');
    }
  };
};
