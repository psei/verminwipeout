'use strict';

var Player = require('../objects/player');
var Level = require('../level');

function polygonHitCheck() {}

var currentLevel = 1;
module.exports = function (game) {
  var level;
  var player;
  var enemies;

  function toggleSounds() {
    game.sound.mute = !game.sound.mute;
  }

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
    enemies.forEach(function (enemy) {
      if (enemy.alive) {
        game.physics.arcade.overlap(enemy, player, player.onEnemyHitsPlayer(enemy), polygonHitCheck, this);
      }
      if (enemy.weapon) {
        game.physics.arcade.overlap(enemy.weapon.bullets, player, player.onEnemyHitsPlayer(enemy), polygonHitCheck, this);
      }
    });
  }

  function toggleFullScreen() {
    if (game.scale.isFullScreen) {
      game.scale.stopFullScreen();
    } else {
      game.scale.startFullScreen();
    }
  }

  function togglePause() {
    game.paused = !game.paused;
  }

  return {
    create: function() {
      level = Level.init(game, currentLevel);
      player = Player.create(game);
      enemies = game.add.group();

      playMusic();
      game.input.keyboard.addKey(Phaser.Keyboard.M).onDown.add(toggleSounds);
      game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT;
      game.input.keyboard.addKey(Phaser.Keyboard.F).onDown.add(toggleFullScreen);
      game.input.keyboard.addKey(Phaser.Keyboard.P).onDown.add(togglePause);
      game.add.button(game.world.width - 249, 7, 'btn-mute', toggleSounds, this);
      game.add.button(game.world.width - 187, 7, 'btn-pause', togglePause, this);
      game.add.button(game.world.width - 122, 7, 'btn-fullscreen', toggleFullScreen, this);


      game.time.physicsElapsedTotalMS = 0;
    },
    update: function() {
      game.time.physicsElapsedTotalMS += game.time.physicsElapsedMS;
      level.update();
      enemies.addMultiple(level.spawnEnemies(game));
      player.update();
      enemies.callAll('update');
      checkCollisions();
    }
  };
};
