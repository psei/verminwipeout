'use strict';

var invokeMap = require('lodash/invokeMap');

var Player = require('../objects/player');
var Level = require('../level');

function polygonHitCheck() {}

function enemyCollection() {
  var enemies = [];

  function removeKilledEnemies() {
    enemies = enemies.filter(function (enemy) {
      return enemy.alive;
    });
  }

  return {
    add: function (newEnemies) {
      enemies = enemies.concat(newEnemies);
    },
    update: function () {
      removeKilledEnemies();
      invokeMap(enemies, 'update');
    },
    map: function (fn) {
      return enemies.map(fn);
    }
  };
}

var currentLevel = 1;
module.exports = function (game) {
  var level;
  var player;
  var enemies = enemyCollection();

  function checkCollisions() {
    enemies.map(function (enemy) {
      game.physics.arcade.overlap(enemy, player, player.onEnemyHitsPlayer(enemy), polygonHitCheck, this);
    })
  }

  return {
    create: function() {
      level = Level.init(game, currentLevel);
      enemies.add(level.spawnEnemies(game));
      player = Player.create(game);
    },
    update: function() {
      level.update();
      enemies.add(level.spawnEnemies(game));
      player.update();
      enemies.update();
      checkCollisions();
    }
  };
};
