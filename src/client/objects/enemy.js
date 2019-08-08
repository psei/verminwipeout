'use strict';

var configsByType = {
  cutterfly: require('./cutterfly.conf'),
  jizzler: require('./jizzler.conf'),
  boss1: require('./boss1.conf'),
  barrier1: require('./barrier1.conf'),
};

var Weapon = require('./weapon');

function Enemy(game, config, spawnInfo) {
  var ownedSprites = game.add.group();
  var flySpriteConfig = config.sprites.enemy;
  var isCurrentlyFiring = false;
  var enemy = game.add.sprite(spawnInfo.x[0], spawnInfo.y[0], flySpriteConfig.animationName);
  ownedSprites.add(enemy);
  game.physics.enable(enemy, window.Phaser.Physics.ARCADE);
  enemy.anchor.setTo(0.5, 0.5);

  enemy.weapon = Weapon.create(game, enemy, require('./weapon1.conf'));
  enemy.weapon.fireAngle = 90;
  enemy.givesSplatter = config.givesSplatter;
  enemy.health = config.health;

  enemy.animations.add(flySpriteConfig.animationName);

  var timeToFlyMotionPath = spawnInfo.time;
  var paths = { x: spawnInfo.x, y: spawnInfo.y };
  var spawnTime = game.time.physicsElapsedTotalMS;

  var blood = game.add.sprite(0, 0, game.findAtlas('blood/blood-0.png'), 'blood/blood-0.png');
  ownedSprites.add(blood);
  blood.visible = false;

  function firstBlood(bullet) {
    if (blood.animations.currentAnim && blood.animations.currentAnim.isPlaying) {
      return;
    }

    blood.visible = true;
    blood.x = bullet.x;
    blood.y = bullet.y;
    blood.scale.setTo(2, 2);
    blood.anchor.setTo(0.5, 0.5);

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
  ownedSprites.add(attackSprite);
  attackSprite.anchor.setTo(0.5, 0.5);
  attackSprite.visible = false;
  enemy.animations.add(attackConfig.animationName);

  enemy.getCausedDamagePoints = function() {
    return config.causesDamagePoints;
  };

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
    }, this);
  };

  enemy.destroy = function() {
    enemy.kill();
    ownedSprites.removeAll(true, true);
  };

  function playDeathAnimation() {
    var deathConfig = config.sprites.death;
    var death = game.add.sprite(enemy.body.x, enemy.body.y, deathConfig.animationName);
    ownedSprites.add(death);
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
    }, this);
  }

  enemy.events.onKilled.add(playDeathAnimation, this);

  enemy.animations.play(flySpriteConfig.animationName, flySpriteConfig.frameRate, true);
  return enemy;
}

module.exports = {
  create: function (game, type, pos) {
    return new Enemy(game, configsByType[type], pos);
  }
};
