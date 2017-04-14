'use strict';

function polygonHitCheck() {}

module.exports = function (game) {
  var Player = require('../objects/player')(game);
  var Debris = require('../objects/debris')(game);
  var background;
  var player;
  var debris;
  return {
    create: function() {
      background = game.add.tileSprite(0, 0, 2000, 4992, 'background');
      player = Player.create();
      debris = Debris.create();
    },
    update: function() {
      background.tilePosition.y += 4;
      Player.update(player);
      Debris.update();
      game.physics.arcade.overlap(debris, player, Player.onEnemyHitsPlayer(debris), polygonHitCheck, this);
    }
  };
};
