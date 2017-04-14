'use strict';

var Player = require('../objects/player');
var Debris = require('../objects/debris');
function polygonHitCheck() {}

module.exports = function (game) {
  var player = Player.create(game);
  var debris = Debris.create(game);

  function checkCollisions() {
    game.physics.arcade.overlap(debris, player, player.onEnemyHitsPlayer(debris), polygonHitCheck, this);
  }

  return {
    create: function() {
      player = Player.create(game);
      debris = Debris.create(game);
    },
    update: function() {
      player.update();
      debris.update();
      checkCollisions();
    }
  };
};
