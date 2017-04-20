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

  function playMusic() {
    var musicIntro = game.add.audio('music-1-intro');
    var musicLoop = game.add.audio('music-1-loop');
    musicLoop.loop = true;
    musicIntro.onStop.add(function () {
      musicLoop.play();
    });
    musicIntro.play();
  }

  function hitEnemy(bullet, enemy) {
    enemy.kill();
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
      playMusic();
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
