'use strict';

var invokeMap = require('lodash/invokeMap');

var Player = require('../objects/player');
var Level = require('../level');

function polygonHitCheck() {}

var currentLevel = 1;
module.exports = function (game) {
  var level;
  var player;
  var enemies;

  function hitEnemy(bullet, enemy) {
    enemy.playDeathAnimation();
    bullet.kill();
  }

  function checkCollisions() {
    game.physics.arcade.overlap(player.weapon.bullets, enemies, hitEnemy, polygonHitCheck, this);
    enemies.forEachAlive(function (enemy) {
      game.physics.arcade.overlap(enemy, player, player.onEnemyHitsPlayer(enemy), polygonHitCheck, this);
    })
  }

  return {
    create: function() {
      level = Level.init(game, currentLevel);
      player = Player.create(game);
      enemies = game.add.group();
    },
    update: function() {
      level.update();
      enemies.addMultiple(level.spawnEnemies(game));
      player.update();
      enemies.callAll('update');
      checkCollisions();
    }
  };
};
