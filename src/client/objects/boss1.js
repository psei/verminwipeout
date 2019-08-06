'use strict';

var config = require('./boss1.conf');

function Boss1(game) {
  var ownedSprites = game.add.group();
  var isCurrentlyFiring = false;


  var boss = game.add.sprite(400, 200, 'verminAtlas', 'enemies/bosses/0-crank/body.png');
  ownedSprites.add(boss);

  var arm1 = game.add.sprite(boss.x - 150, boss.y - 40, 'verminAtlas', 'enemies/bosses/0-crank/arm0.png');
  ownedSprites.add(arm1);

  var arm2 = game.add.sprite(boss.x + 30, boss.y - 40, 'verminAtlas', 'enemies/bosses/0-crank/arm1.png');
  ownedSprites.add(arm2);

  var arm3 = game.add.sprite(boss.x + 30, boss.y + 30, 'verminAtlas', 'enemies/bosses/0-crank/arm2a.png');
  ownedSprites.add(arm3);

  var arm4 = game.add.sprite(boss.x + 30 + 50, boss.y + 30 + 60, 'verminAtlas', 'enemies/bosses/0-crank/arm3b.png');
  ownedSprites.add(arm4);

  var arm5 = game.add.sprite(boss.x - 110, boss.y + 30, 'verminAtlas', 'enemies/bosses/0-crank/arm3a.png');
  ownedSprites.add(arm5);

  var arm6 = game.add.sprite(boss.x - 110 - 30, boss.y + 30 + 60, 'verminAtlas', 'enemies/bosses/0-crank/arm2b.png');
  ownedSprites.add(arm6);

  game.physics.enable(boss, window.Phaser.Physics.ARCADE);
  boss.anchor.setTo(0.5, 0.5);
  boss.givesSplatter = config.givesSplatter;
  boss.health = config.health;

  var blood = game.add.sprite(0, 0, 'verminAtlas', 'enemies/bosses/0-crank/firstblood/00.png');
  ownedSprites.add(blood);
  const frames = Phaser.Animation.generateFrameNames('enemies/bosses/0-crank/firstblood/', 1, 13, '.png', 2);
  blood.animations.add('crankFirstBlood', frames, 15, false);
  blood.anchor.setTo(0.5, 0.5);
  blood.visible = false;

  function firstBlood() {
    if (blood.animations.currentAnim && blood.animations.currentAnim.isPlaying) {
      return;
    }

    blood.x = boss.x - 5;
    blood.y = boss.y + 30;
    blood.visible = true;
    blood.animations.play('crankFirstBlood');
    blood.animations.currentAnim.onComplete.add(() => { blood.visible = false; });
  }

  boss.takeBulletHit = function(bullet) {
    boss.health -= bullet.data.bulletManager.causesDamagePoints;
    if (boss.health < 0) {
      boss.kill();
    }

    if (boss.alive) {
      firstBlood();
    }
  };

  boss.update = function () {
    if (boss.alive) {
      if (!isCurrentlyFiring && game.random.rollForChancePerSecond(config.chanceToShootPerSecondInPercent)) {
        boss.attack();
      }
    }
  };

  boss.getCausedDamagePoints = function() {
    return config.causesDamagePoints;
  };

  var attackSprite = game.add.sprite(0, 0, 'verminAtlas', 'enemies/bosses/0-crank/shot1/00.png');
  ownedSprites.add(attackSprite);
  attackSprite.anchor.setTo(0.5, 0.5);
  attackSprite.visible = false;
  const attackFrames = Phaser.Animation.generateFrameNames('enemies/bosses/0-crank/shot1/', 1, 27, '.png', 2);
  attackSprite.animations.add('crankAttack1', attackFrames, 15, false);
  game.physics.enable(attackSprite, window.Phaser.Physics.ARCADE);

  boss.weapon = {
    bullets: []
  };

  boss.attack = function () {
    isCurrentlyFiring = true;
    boss.weapon.bullets.push(attackSprite);
    boss.hasHitPlayerOnce = false;

    attackSprite.x = boss.x + 25;
    attackSprite.y = boss.y + attackSprite.height / 2;
    attackSprite.visible = true;
    attackSprite.animations.play('crankAttack1');
    attackSprite.animations.currentAnim.onComplete.add(() => {
      attackSprite.visible = false;
      isCurrentlyFiring = false;
      boss.weapon.bullets = [];
    });
  };

  boss.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  boss.events.onKilled.add(() => { boss.destroy(); }, this);

  return boss;
}

module.exports = {
  create: function (game) {
    return new Boss1(game);
  }
};
