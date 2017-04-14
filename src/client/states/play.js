'use strict';

var Player = require('../objects/player');
var Debris = require('../objects/debris');
var Level = require('../level');
function polygonHitCheck() {}

var currentLevel = 1;
module.exports = function (game) {
  var level;
  var player;
  var debris;

  function checkCollisions() {
    game.physics.arcade.overlap(debris, player, player.onEnemyHitsPlayer(debris), polygonHitCheck, this);
  }

  return {
    create: function() {
      level = Level.init(game, currentLevel);
      player = Player.create(game);
      debris = Debris.create(game);
    },
    update: function() {
      level.update();
      player.update();
      debris.update();
      checkCollisions();
    }
  };
};
