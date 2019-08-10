'use strict';

var config = require('./boss1.conf');
const STATE_IDLE = 'idle';
const STATE_SPEAR_ATTACK_PREPARE = 'spearPrepare';
const STATE_SPEAR_ATTACK_RUN = 'spearRun';
const STATE_ACID_BALLS_PREPARE = 'acidPrepare';
const STATE_ACID_BALLS_SHOOT = 'acidShoot';
const STATE_SNAP_EAT_PREPARE = 'snapPrepare';
const STATE_SNAP_EAT_RUN = 'snapRun';

function Boss1(game) {
  var ownedSprites = game.add.group();
  ownedSprites.x = game.world.width / 2;
  ownedSprites.y = 270;

  var bossName = game.add.image(200, 350, 'verminBasics', 'interface/boss-names/00.png');

  var boss = game.add.sprite(game.world.width / 2 - 70, 270, 'verminEnemies', 'enemies/bosses/0-crank/body.png');
  ownedSprites.add(boss);
  boss.visible = false;
  boss.isBoss = true;

  var bossState;
  var bossNextState = STATE_SNAP_EAT_PREPARE;
  var stateStartTime;

  setTimeout(() => {
    bossName.destroy();
    boss.visible = true;
    ownedSprites.create(-160, 40, 'verminEnemies', 'enemies/bosses/0-crank/arm0.png');
    ownedSprites.create(20, 40, 'verminEnemies', 'enemies/bosses/0-crank/arm1.png');
    ownedSprites.create(40, 95, 'verminEnemies', 'enemies/bosses/0-crank/arm2a.png');
    ownedSprites.create(90, 95 + 60, 'verminEnemies', 'enemies/bosses/0-crank/arm3b.png');
    ownedSprites.create(-100, 95, 'verminEnemies', 'enemies/bosses/0-crank/arm3a.png');
    ownedSprites.create(-130, 95 + 60, 'verminEnemies', 'enemies/bosses/0-crank/arm2b.png');

    game.physics.enable(boss, window.Phaser.Physics.ARCADE);
    boss.givesSplatter = config.givesSplatter;
    boss.health = config.health;

    var blood = game.add.sprite(0, 90, 'verminEnemies', 'enemies/bosses/0-crank/firstblood/00.png');
    ownedSprites.add(blood);
    const frames = Phaser.Animation.generateFrameNames('enemies/bosses/0-crank/firstblood/', 0, 13, '.png', 2);
    blood.animations.add('crankFirstBlood', frames, 15, false);
    blood.scale.setTo(0.5, 0.5);
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

    boss.getScorePointsOnHit = function() {
      return 250;
    };

    function setState(newState) {
      bossState = newState;
      stateStartTime = game.time.physicsElapsedTotalMS;

      switch (newState) {
        case STATE_IDLE:
          targetAngle = 0;
          break;
        case STATE_ACID_BALLS_PREPARE:
          targetAngle = game.random.between(-20, 20);
          break;
        case STATE_ACID_BALLS_SHOOT:
          launchAcidBall();
          bossNextState = STATE_SPEAR_ATTACK_PREPARE;
          break;
        case STATE_SNAP_EAT_PREPARE:
          targetY = boss.y - 40;
          break;
        case STATE_SNAP_EAT_RUN:
          targetY = game.world.width - 1;
          bossNextState = STATE_ACID_BALLS_PREPARE;
          break;
        case STATE_SPEAR_ATTACK_PREPARE:
          targetY = boss.y - 40;
          break;
        case STATE_SPEAR_ATTACK_RUN:
          targetY = game.world.width - 1;
          bossNextState = STATE_SNAP_EAT_PREPARE;
          break;
      }
    }

    var moveSpeedX;
    var moveSpeedY;
    var angleSpeed;
    var targetAngle;
    var targetY;
    setState(STATE_IDLE);

    function moveIdle() {
      if (boss.x < 50) {
        moveSpeedX = 2;
      } else if (boss.x > game.world.width - 150) {
        moveSpeedX = -2;
      }

      if (boss.y > 350) {
        moveSpeedY = -1;
      } else  if (boss.y < 200) {
        moveSpeedY = 1;
      }

      if (boss.angle > targetAngle) {
        angleSpeed = -1;
      } else if (boss.angle < targetAngle) {
        angleSpeed = 1;
      } else {
        angleSpeed = 0;
      }

      boss.x += moveSpeedX;
      boss.y += moveSpeedY;
      boss.angle += angleSpeed;

      ownedSprites.x += moveSpeedX;
      ownedSprites.y += moveSpeedY;
      ownedSprites.angle += angleSpeed;

      const idleTime = game.time.physicsElapsedTotalMS - stateStartTime;
      const isNearCenter = Math.abs(boss.x - game.world.width / 2) < 10;
      if (bossNextState === STATE_ACID_BALLS_PREPARE && idleTime > 1000 && isNearCenter) {
        setState(STATE_ACID_BALLS_PREPARE);
      }

      if (bossNextState === STATE_SNAP_EAT_PREPARE && idleTime > 1000) {
        setState(STATE_SNAP_EAT_PREPARE);
      }

      if (bossNextState === STATE_SPEAR_ATTACK_PREPARE && idleTime > 1000) {
        setState(STATE_SPEAR_ATTACK_PREPARE);
      }
    }

    function prepareSpearAttack() {
      if (boss.y > targetY) {
        boss.y -= 0.5;
      } else {
        boss.y = ownedSprites.y;
        setState(STATE_SPEAR_ATTACK_RUN);
      }
    }

    function moveSpearAttack() {
      if (boss.y < targetY) {
        moveSpeedY = 15;
      }
      if (boss.y > game.world.width - 10) {
        moveSpeedY = -2;
        targetY = 190;
      }

      if (boss.y < 200) {
        setState(STATE_IDLE);
      }

      boss.y += moveSpeedY;
      ownedSprites.y += moveSpeedY;
    }

    function prepareSnapEat() {
      if (boss.y > targetY) {
        boss.y -= 0.5;
      } else {
        boss.y = ownedSprites.y;
        setState(STATE_SNAP_EAT_RUN);
      }
    }

    function moveSnapEat() {
      if (boss.y < targetY) {
        moveSpeedY = 7;
      }
      if (boss.y > game.world.width - 10) {
        moveSpeedY = -2;
        targetY = 190;
      }

      if (boss.y < 200) {
        setState(STATE_IDLE);
      }

      boss.y += moveSpeedY;
      ownedSprites.y += moveSpeedY;
    }

    function moveAcidBalls() {
      if (Math.abs(boss.angle - targetAngle) < 1) {
        angleSpeed = 0;
        setState(STATE_ACID_BALLS_SHOOT);
      }

      if (boss.angle < targetAngle) {
        angleSpeed = 0.1;
      } else {
        angleSpeed = -0.1;
      }

      boss.angle += angleSpeed;
      ownedSprites.angle += angleSpeed;
    }

    boss.update = function () {
      if (boss.alive) {
        switch (bossState) {
          case STATE_IDLE:
            moveIdle();
            break;
          case STATE_ACID_BALLS_PREPARE:
            moveAcidBalls();
            break;
          case STATE_SNAP_EAT_RUN:
            moveSnapEat();
            break;
          case STATE_SNAP_EAT_PREPARE:
            prepareSnapEat();
            break;
          case STATE_SPEAR_ATTACK_RUN:
            moveSpearAttack();
            break;
          case STATE_SPEAR_ATTACK_PREPARE:
            prepareSpearAttack();
            break;
        }
      }
    };

    boss.getCausedDamagePoints = function() {
      return config.causesDamagePoints;
    };

    var attackSprite = game.add.sprite(25, 400, 'verminEnemies', 'enemies/bosses/0-crank/shot1/00.png');
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

    function launchAcidBall() {
      boss.hasHitPlayerOnce = false;
      boss.weapon.bullets.push(attackSprite);
      attackSprite.body.setSize(60, 600, 140, 0);
      attackSprite.visible = true;
      attackSprite.animations.play('crankAttack1');
      attackSprite.animations.currentAnim.onComplete.add(() => {
        attackSprite.visible = false;
        setState(STATE_IDLE);
        boss.weapon.bullets = [];
      });
    }

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
