'use strict';

var config = require('./enemy.conf');

function Enemy(game, spawnInfo) {
  var spriteConfig = config.sprites.enemy;

  var enemy = game.add.sprite(spawnInfo.x[0], spawnInfo.y[0], spriteConfig.animationName);
  game.physics.enable(enemy, window.Phaser.Physics.ARCADE);
  enemy.anchor.setTo(0.5, 0.5);

  enemy.animations.add(spriteConfig.animationName);
  enemy.frame = 1;
  enemy.animations.play(spriteConfig.animationName, spriteConfig.frameRate, true);

  var timeToFlyMotionPath = spawnInfo.time;
  var paths = { x: spawnInfo.x, y: spawnInfo.y };
  var spawnTime = game.time.time;

  function move() {
    var timePassed = game.time.time - spawnTime;
    var step = 0;
    if (timePassed) {
      step = timePassed / timeToFlyMotionPath;
    }
    if (step > 1) {
      enemy.destroy();
    }
    var newX = game.math.catmullRomInterpolation(paths.x, step);
    var newY = game.math.catmullRomInterpolation(paths.y, step);
    enemy.x = newX;
    enemy.y = newY;
  }

  enemy.update = function () {
    if (enemy.alive) {
      move();
    }
  };

  function playDeathAnimation() {
    var deathConfig = config.sprites.death;
    var death = game.add.sprite(enemy.body.x, enemy.body.y, deathConfig.animationName);
    death.anchor.setTo(0.5, 0.5);
    death.animations.add(
      deathConfig.animationName);
    death.frame = 1;
    death.animations.play(deathConfig.animationName,
      deathConfig.frameRate,
      false,
      true);
  }

  enemy.events.onKilled.add(playDeathAnimation);

  return enemy;
}

module.exports = {
  create: function (game, pos) {
    return new Enemy(game, pos);
  }
};
