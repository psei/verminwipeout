'use strict';

var config = require('./boss1.conf');

function Boss1(game) {
  var ownedSprites = game.add.group();
  ownedSprites.x = game.world.width / 2;
  ownedSprites.y = 270;
  var isCurrentlyFiring = false;

  var bossName = game.add.image(200, 350, game.findAtlas('interface/boss-names/00.png'), 'interface/boss-names/00.png');

  var boss = game.add.sprite(game.world.width / 2 - 70, 270, game.findAtlas('enemies/bosses/0-crank/body.png'), 'enemies/bosses/0-crank/body.png');
  ownedSprites.add(boss);
  boss.visible = false;

  setTimeout(() => {
    bossName.destroy();
    boss.visible = true;
    ownedSprites.create(-160, 40, game.findAtlas('enemies/bosses/0-crank/arm0.png'), 'enemies/bosses/0-crank/arm0.png');
    ownedSprites.create(20, 40, game.findAtlas('enemies/bosses/0-crank/arm1.png'), 'enemies/bosses/0-crank/arm1.png');
    ownedSprites.create(40, 95, game.findAtlas('enemies/bosses/0-crank/arm2a.png'), 'enemies/bosses/0-crank/arm2a.png');
    ownedSprites.create(90, 95 + 60, game.findAtlas('enemies/bosses/0-crank/arm3b.png'), 'enemies/bosses/0-crank/arm3b.png');
    ownedSprites.create(-100, 95, game.findAtlas('enemies/bosses/0-crank/arm3a.png'), 'enemies/bosses/0-crank/arm3a.png');
    ownedSprites.create(-130, 95 + 60, game.findAtlas('enemies/bosses/0-crank/arm2b.png'), 'enemies/bosses/0-crank/arm2b.png');

    game.physics.enable(boss, window.Phaser.Physics.ARCADE);
    boss.givesSplatter = config.givesSplatter;
    boss.health = config.health;

    var blood = game.add.sprite(0, 90, game.findAtlas('enemies/bosses/0-crank/firstblood/00.png'), 'enemies/bosses/0-crank/firstblood/00.png');
    ownedSprites.add(blood);
    const frames = Phaser.Animation.generateFrameNames('enemies/bosses/0-crank/firstblood/', 0, 13, '.png', 2);
    blood.animations.add('crankFirstBlood', frames, 15, false);
    blood.anchor.setTo(0.5, 0.5);
    blood.visible = false;

    function firstBlood() {
      if (blood.animations.currentAnim && blood.animations.currentAnim.isPlaying) {
        return;
      }

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

    var attackSprite = game.add.sprite(25, 400, game.findAtlas('enemies/bosses/0-crank/shot1/00.png'), 'enemies/bosses/0-crank/shot1/00.png');
    game.physics.enable(attackSprite, window.Phaser.Physics.ARCADE);
    ownedSprites.add(attackSprite);
    attackSprite.anchor.setTo(0.5, 0.5);
    attackSprite.visible = false;
    const attackFrames = Phaser.Animation.generateFrameNames('enemies/bosses/0-crank/shot1/', 0, 27, '.png', 2);
    attackSprite.animations.add('crankAttack1', attackFrames, 15, false);
    game.physics.enable(attackSprite, window.Phaser.Physics.ARCADE);

    boss.weapon = {
      bullets: []
    };

    boss.attack = function () {
      const attackAngle = game.random.between(-20, 20);
      boss.angle = attackAngle;
      ownedSprites.angle = attackAngle;
      isCurrentlyFiring = true;

      setTimeout(() => {
        boss.hasHitPlayerOnce = false;
        boss.weapon.bullets.push(attackSprite);
        attackSprite.body.setSize(60, 600, 140, 0);
        attackSprite.visible = true;
        attackSprite.animations.play('crankAttack1');
        attackSprite.animations.currentAnim.onComplete.add(() => {
          attackSprite.visible = false;
          isCurrentlyFiring = false;
          boss.weapon.bullets = [];
          ownedSprites.angle = 0;
          boss.angle = 0;
          ownedSprites.angle = 0;
        })}, 500);
    };

    boss.destroy = function() {
      ownedSprites.removeAll(true, true);
    };

    boss.events.onKilled.add(() => { boss.destroy(); }, this);
  }, 3000);

  return boss;
}

module.exports = {
  create: function (game) {
    return new Boss1(game);
  }
};
