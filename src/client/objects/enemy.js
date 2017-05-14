'use strict';

var configsByType = {
  cutterfly: require('./cutterfly.conf'),
  jizzler: require('./jizzler.conf')
};

var Weapon = require('./weapon');

function Enemy(game, config, spawnInfo) {
  var flySpriteConfig = config.sprites.enemy;
  var isCurrentlyFiring = false;
  var enemy = game.add.sprite(spawnInfo.x[0], spawnInfo.y[0], flySpriteConfig.animationName);
  game.physics.enable(enemy, window.Phaser.Physics.ARCADE);
  enemy.anchor.setTo(0.5, 0.5);

  enemy.weapon = Weapon.create(game, enemy, require('./weapon1.conf'));
  enemy.weapon.fireAngle = 90;

  enemy.animations.add(flySpriteConfig.animationName);

  var timeToFlyMotionPath = spawnInfo.time;
  var paths = { x: spawnInfo.x, y: spawnInfo.y };
  var spawnTime = game.time.physicsElapsedTotalMS;

  function move() {
    var timePassed = game.time.physicsElapsedTotalMS - spawnTime;
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
    attackSprite.x = newX;
    attackSprite.y = newY;
  }

  enemy.update = function () {
    if (enemy.alive) {
      if (!isCurrentlyFiring && game.random.rollForChancePerSecond(config.chanceToShootPerSecondInPercent)) {
        enemy.attack();
      }
      move();
    }
  };

  var attackConfig = config.sprites.attack;
  var attackSprite = game.add.sprite(enemy.body.x, enemy.body.y, attackConfig.animationName);
  attackSprite.anchor.setTo(0.5, 0.5);
  attackSprite.visible = false;
  enemy.animations.add(attackConfig.animationName);

  enemy.attack = function () {
    attackSprite.frame = 1;
    attackSprite.visible = true;
    isCurrentlyFiring = true;
    enemy.animations.play(attackConfig.animationName, attackConfig.frameRate);
    enemy.animations.currentAnim.onComplete.add(function () {
      attackSprite.visible = false;
      isCurrentlyFiring = false;
      enemy.weapon.fire();
      enemy.frame = 1;
      enemy.animations.play(flySpriteConfig.animationName, flySpriteConfig.frameRate, true);
    });
  };

  function playDeathAnimation() {
    var deathConfig = config.sprites.death;
    var death = game.add.sprite(enemy.body.x, enemy.body.y, deathConfig.animationName);
    death.anchor.setTo(0.5, 0.5);
    death.animations.add(deathConfig.animationName);
    death.frame = 1;
    death.animations.play(deathConfig.animationName,
      deathConfig.frameRate,
      false,
      true);
    attackSprite.destroy();
    enemy.animations.currentAnim.onComplete.add(function () {
      enemy.destroy();
    });
  }

  enemy.events.onKilled.add(playDeathAnimation);

  return enemy;
}

module.exports = {
  create: function (game, type, pos) {
    return new Enemy(game, configsByType[type], pos);
  }
};
