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
    player.handleBulletHitEnemy(bullet, enemy);
    enemy.takeBulletHit(bullet);
    bullet.kill();
  }

  function checkCollisions() {
    game.physics.arcade.overlap(player.weapon.bullets, enemies, hitEnemy, polygonHitCheck, this);
    enemies.forEach(function (enemy) {
      if (enemy.weapon) {
        game.physics.arcade.overlap(enemy.weapon.bullets, player, player.onEnemyHitsPlayer(enemy), polygonHitCheck, this);
      }

      if (enemy.alive) {
        game.physics.arcade.overlap(enemy, player, player.onEnemyHitsPlayer(enemy), polygonHitCheck, this);
      } else {
        enemies.remove(enemy);
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

  function resetCurrentLevel() {
    if (!game.paused) {
      return;
    }

    togglePause();

    enemies.callAll('destroy');
    enemies.removeAll(true, true);
    level.destroy();
    player.destroy();

    level = Level.init(game, currentLevel);
    player = Player.create(game);

    game.time.physicsElapsedTotalMS = 0;
  }

  function onTouch() {
    if (player.alive) {
      if (game.paused) {
        game.paused = false;
      }
    } else {
      resetCurrentLevel();
    }
  }

  return {
    create: function() {
      player = Player.create(game);
      enemies = game.add.group();
      game.world.sendToBack(enemies);
      level = Level.init(game, currentLevel);

      playMusic();
      toggleSounds();
      game.input.keyboard.addKey(Phaser.Keyboard.M).onDown.add(toggleSounds);
      game.input.keyboard.addKey(Phaser.Keyboard.F).onDown.add(toggleFullScreen);
      game.input.keyboard.addKey(Phaser.Keyboard.P).onDown.add(togglePause);
      game.input.keyboard.addKey(Phaser.Keyboard.S).onDown.add(resetCurrentLevel, this);

      game.input.touch.addTouchLockCallback(onTouch, this);

      game.add.button(game.world.width - 55, 5, 'btn-mute', toggleSounds, this);
      game.add.button(5, 5, 'btn-pause', togglePause, this);

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
