'use strict';

var Player = require('../objects/player');
var Level = require('../level');

function polygonHitCheck() {}

var currentLevel = 1;
module.exports = function (game) {
  var level;
  var player;
  var enemies;
  var finalStation;
  var lifeCounter = 3;

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
    enemy.takeBulletHit(bullet);
    bullet.kill();
    player.handleBulletHitEnemy(bullet, enemy);
    if (enemy.isBoss && enemy.alive !== true) {
      level.startBackground();
      finalStation = level.spawnFinalStation(game);
      enemies.add(finalStation);
    }
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

    if (lifeCounter === 1) {
      currentLevel = 1;
      lifeCounter = 3;
    } else {
      lifeCounter -= 1;
    }

    togglePause();

    enemies.callAll('destroy');
    enemies.removeAll(true, true);
    level.destroy();
    player.destroy();

    level = Level.init(game, currentLevel);
    player = Player.create(game, lifeCounter);

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
      player = Player.create(game, lifeCounter);
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

      var pauseBtn = game.add.button(10, 10, 'verminBasics', togglePause, this, 'interface/buttons/pause.png', 'interface/buttons/pause.png', 'interface/buttons/pause.png', 'interface/buttons/pause.png');
      pauseBtn.scale.setTo(0.5, 0.5);

      var muteBtn = game.add.button(75, 10, 'verminBasics', toggleSounds, this, 'interface/buttons/sound.png', 'interface/buttons/sound.png', 'interface/buttons/sound.png', 'interface/buttons/sound.png');
      muteBtn.scale.setTo(0.5, 0.5);

      game.time.physicsElapsedTotalMS = 0;
    },
    update: function() {
      game.time.physicsElapsedTotalMS += game.time.physicsElapsedMS;
      level.update();
      const newEnemies = level.spawnEnemies(game);
      const isBoss = newEnemies.filter((enemy) => enemy.isBoss).length > 0;
      if (isBoss) {
        level.stopBackground();
      }
      if (finalStation && finalStation.y >= game.world.height / 2) {
        game.state.start('trader', true, false, player.getScore());
      }
      enemies.addMultiple(newEnemies);
      player.update();
      enemies.callAll('update');
      checkCollisions();
    },
    init: function() {
      finalStation = null;
    }
  };
};
