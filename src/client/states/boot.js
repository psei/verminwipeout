'use strict';

var each = require('lodash/each');

var playerConfig = require('../objects/player.conf');
var debrisConfig = require('../objects/debris.conf');

module.exports = function (game) {
  return {
    preload: function () {
      game.load.image('weapon-bullet', '/images/Shots/shot_0_0.png');
      each(playerConfig.images, function (imageSrc) {
        game.load.image(imageSrc, imageSrc);
      });
      each(debrisConfig.images, function (imageSrc) {
        game.load.image(imageSrc, imageSrc);
      });
    },
    create: function () {
      game.stage.backgroundColor = '#F0F0F0';
      game.state.clearCurrentState();
      game.state.start('play');
    }
  };
};
