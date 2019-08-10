'use strict';

var configsByType = {
  cutterfly: require('./cutterfly.conf'),
  ghumbo: require('./ghumbo.conf'),
  jizzler: require('./jizzler.conf'),
  sawjaw: require('./sawjaw.conf'),
  boss1: require('./boss1.conf'),
  barrier1: require('./barrier1.conf'),
};

var Weapon = require('../weapon');

function Enemy(game, config, spawnInfo) {
  var ownedSprites = game.add.group();
  var isCurrentlyFiring = false;
  var enemy = game.add.sprite(spawnInfo.x[0], spawnInfo.y[0], config.spriteName, config.spriteFolder + '/fly/00.png');
  ownedSprites.add(enemy);
  game.physics.enable(enemy, window.Phaser.Physics.ARCADE);
  enemy.anchor.setTo(0.5, 0.5);
  enemy.scale.setTo(config.scaleFactor, config.scaleFactor);
  enemy.body.setSize(config.body.width, config.body.height, config.body.offsetX, config.body.offsetY);

  const flyFrames = Phaser.Animation.generateFrameNames(config.spriteFolder + '/fly/', 0, config.frameInfo.fly.count, '.png', 2);
  enemy.animations.add('fly', flyFrames, config.frameInfo.fly.rate, false);

  const attackFrames = Phaser.Animation.generateFrameNames(config.spriteFolder + '/attack/', 0, config.frameInfo.attack.count, '.png', 2);
  enemy.animations.add('attack', attackFrames, config.frameInfo.attack.rate, false);

  enemy.weapon = Weapon.create(game, enemy, require('../weapon1.conf'));
  enemy.weapon.fireAngle = 90;
  enemy.givesSplatter = config.givesSplatter;
  enemy.health = config.health;

  var timeToFlyMotionPath = spawnInfo.time;
  var paths = { x: spawnInfo.x, y: spawnInfo.y };
  var spawnTime = game.time.physicsElapsedTotalMS;

  var blood = game.add.sprite(0, 0, 'verminBasics', 'blood/blood-0.png');
  ownedSprites.add(blood);
  blood.scale.setTo(0.5, 0.5);
  blood.anchor.setTo(0.5, 0.5);
  blood.visible = false;

  function firstBlood(bullet) {
    if (blood.animations.currentAnim && blood.animations.currentAnim.isPlaying) {
      return;
    }

    blood.visible = true;
    blood.x = bullet.x;
    blood.y = bullet.y;

    const frames = Phaser.Animation.generateFrameNames('blood/blood-', 0, 2, '.png');
    blood.animations.add('enemyBloodAni', frames, 5, false);
    blood.animations.play('enemyBloodAni');
    blood.animations.currentAnim.onComplete.add(() => { blood.visible = false; });
  }

  enemy.takeBulletHit = function(bullet) {
    enemy.health -= bullet.data.bulletManager.causesDamagePoints;
    if (enemy.health < 0) {
      enemy.kill();
    }

    if (enemy.alive) {
      firstBlood(bullet);
    }
  };

  enemy.getScorePointsOnHit = function() {
    return 100;
  };

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
  }

  enemy.update = function () {
    if (enemy.alive) {
      if (!isCurrentlyFiring && game.random.rollForChancePerSecond(config.chanceToShootPerSecondInPercent)) {
        enemy.attack();
      }
      move();
    }
  };

  enemy.getCausedDamagePoints = function() {
    return config.causesDamagePoints;
  };

  enemy.attack = function () {
    isCurrentlyFiring = true;
    enemy.animations.play('attack');
    enemy.animations.currentAnim.onComplete.add(function () {
      isCurrentlyFiring = false;
      enemy.weapon.fire();
      enemy.animations.play('fly', config.frameInfo.fly.rate, true);
    }, this);
  };

  enemy.destroy = function() {
    enemy.kill();
    ownedSprites.removeAll(true, true);
  };

  function playDeathAnimation() {
    var death = game.add.sprite(enemy.x, enemy.y, config.spriteName, config.spriteFolder + '/death/00.png');
    ownedSprites.add(death);
    death.anchor.setTo(0.5, 0.5);
    death.scale.setTo(config.scaleFactor, config.scaleFactor);
    enemy.visible = false;
    const frames = Phaser.Animation.generateFrameNames(config.spriteFolder + '/death/', 0, config.frameInfo.death.count, '.png', 2);
    death.animations.add('death', frames, config.frameInfo.death.rate, false);
    death.animations.play('death');
    death.animations.currentAnim.onComplete.add(function () {
      enemy.destroy();
    }, this);
  }

  enemy.events.onKilled.add(playDeathAnimation, this);

  enemy.animations.play('fly', config.frameInfo.fly.rate, true);
  return enemy;
}

module.exports = {
  create: function (game, type, pos) {
    return new Enemy(game, configsByType[type], pos);
  }
};
