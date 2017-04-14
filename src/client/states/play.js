'use strict';

module.exports = function (game) {
  var Player = require('../objects/player')(game);
  var background;
  var player;
  return {
    create: function() {
      background = game.add.tileSprite(0, 0, 2000, 4992, 'background');
      player = Player.create();
    },
    update: function() {
      background.tilePosition.y += 4;
      Player.update(player);
    }
  };
};
