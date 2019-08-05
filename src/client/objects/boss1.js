'use strict';

var configsByType = {
  cutterfly: require('./cutterfly.conf'),
  jizzler: require('./jizzler.conf'),
  boss1: require('./boss1.conf'),
};

var Weapon = require('./weapon');

function Boss1(game, config) {
  var ownedSprites = game.add.group();
  var flySpriteConfig = config.sprites.enemy;
  var isCurrentlyFiring = false;
  var boss = game.add.sprite(400, 200, flySpriteConfig.animationName);

    boss.hitArea = new Phaser.Polygon([
      new Phaser.Point(100, 20),
      new Phaser.Point(240, 20),
      new Phaser.Point(240, 100),
      new Phaser.Point(120, 100),
    ]);

  ownedSprites.add(boss);
  game.physics.enable(boss, window.Phaser.Physics.ARCADE);
  boss.anchor.setTo(0.5, 0.5);

  boss.weapon = Weapon.create(game, boss, require('./weapon1.conf'));
  boss.weapon.fireAngle = 90;
  boss.givesSplatter = config.givesSplatter;
  boss.health = config.health;

  boss.animations.add(flySpriteConfig.animationName);

  var blood = game.add.sprite(0, 0, 'bloodAtlas', 'blood-0');
  ownedSprites.add(blood);
  blood.visible = false;

  function firstBlood(bullet) {
    if (blood.animations.currentAnim && blood.animations.currentAnim.isPlaying) {
      return;
    }

    blood.visible = true;
    blood.x = bullet.x;
    blood.y = bullet.y;
    blood.scale.setTo(0.5, 0.5);
    blood.anchor.setTo(0.5, 0.5);

    const frames = Phaser.Animation.generateFrameNames('blood-', 1, 2, '');
    blood.animations.add('enemyBloodAni', frames, 5, false);
    blood.animations.play('enemyBloodAni');
    blood.animations.currentAnim.onComplete.add(() => { blood.visible = false; });
  }

  boss.takeBulletHit = function(bullet) {
    boss.health -= bullet.data.bulletManager.causesDamagePoints;
    if (boss.health < 0) {
      boss.kill();
    }

    if (boss.alive) {
      firstBlood(bullet);
    }
  };

  boss.update = function () {
    if (boss.alive) {
      if (!isCurrentlyFiring && game.random.rollForChancePerSecond(config.chanceToShootPerSecondInPercent)) {
        boss.attack();
      }
    }
  };

  var attackConfig = config.sprites.attack;
  var attackSprite = game.add.sprite(boss.body.x, boss.body.y, attackConfig.animationName);
  ownedSprites.add(attackSprite);
  attackSprite.anchor.setTo(0.5, 0.5);
  attackSprite.visible = false;
  boss.animations.add(attackConfig.animationName);

  boss.getCausedDamagePoints = function() {
    return config.causesDamagePoints;
  };

  boss.attack = function () {
    attackSprite.frame = 1;
    attackSprite.visible = true;
    isCurrentlyFiring = true;
    boss.animations.play(attackConfig.animationName, attackConfig.frameRate);
    boss.animations.currentAnim.onComplete.add(function () {
      attackSprite.visible = false;
      isCurrentlyFiring = false;
      boss.weapon.fire();
      boss.frame = 1;
      boss.animations.play(flySpriteConfig.animationName, flySpriteConfig.frameRate, true);
    }, this);
  };

  boss.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  boss.events.onKilled.add(() => { boss.destroy(); }, this);

  boss.animations.play(flySpriteConfig.animationName, flySpriteConfig.frameRate, true);
  return boss;
}

module.exports = {
  create: function (game, type, pos) {
    return new Boss1(game, configsByType[type], pos);
  }
};
