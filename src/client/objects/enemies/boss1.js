'use strict';

var config = require('./boss1.conf');
const STATE_IDLE = 'idle';
const STATE_SPEAR_ATTACK = 'spearAttack';
const STATE_ACID_BALLS_PREPARE = 'acidPrepare';
const STATE_ACID_BALLS_SHOOT = 'acidShoot';
const STATE_SNAP_EAT_PREPARE = 'snapPrepare';
const STATE_SNAP_EAT_RUN = 'snapRun';

function Boss1(game) {
  const ownedSprites = game.add.group();
  ownedSprites.x = game.world.width / 2;
  ownedSprites.y = 270;

  const bossName = game.add.image(200, 350, 'verminBasics', 'interface/boss-names/00.png');
  setTimeout(() => {
    bossName.destroy();
  }, 3000);

  var boss = game.add.sprite(game.world.width / 2 - 70, 270, 'verminEnemies', 'enemies/bosses/0-crank/body.png');
  ownedSprites.add(boss);
  game.physics.enable(boss, window.Phaser.Physics.ARCADE);
  boss.isBoss = true;
  boss.y -= 500;
  boss.givesSplatter = config.givesSplatter;
  boss.health = config.health;
  boss.scale.setTo(1.7, 1.7);
  ownedSprites.y -= 500;

  ownedSprites.create(-260, 60, 'verminEnemies', 'enemies/bosses/0-crank/arm0.png');
  ownedSprites.getAt(1).scale.setTo(1.7, 1.7);
  ownedSprites.create(130, 60, 'verminEnemies', 'enemies/bosses/0-crank/arm1.png');
  ownedSprites.getAt(2).scale.setTo(1.7, 1.7);
  ownedSprites.create(130, 165, 'verminEnemies', 'enemies/bosses/0-crank/arm2a.png');
  ownedSprites.getAt(3).scale.setTo(1.7, 1.7);
  const arm3b = ownedSprites.create(210, 165 + 80, 'verminEnemies', 'enemies/bosses/0-crank/arm3b.png');
  ownedSprites.getAt(4).scale.setTo(1.7, 1.7);
  ownedSprites.create(-140, 165, 'verminEnemies', 'enemies/bosses/0-crank/arm3a.png');
  ownedSprites.getAt(5).scale.setTo(1.7, 1.7);
  ownedSprites.create(-170, 165 + 60, 'verminEnemies', 'enemies/bosses/0-crank/arm2b.png');
  ownedSprites.getAt(6).scale.setTo(1.7, 1.7);

  const blood = game.add.sprite(40, 140, 'verminEnemies', 'enemies/bosses/0-crank/firstblood/00.png');
  ownedSprites.add(blood);
  const frames = Phaser.Animation.generateFrameNames('enemies/bosses/0-crank/firstblood/', 0, 13, '.png', 2);
  blood.animations.add('crankFirstBlood', frames, 15, false);
  blood.scale.setTo(1.5, 1.5);
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

  var bossState;
  var bossNextState = STATE_SPEAR_ATTACK;
  var stateStartTime;
  var moveSpeedX = 2;
  var moveSpeedY = 1;
  var angleSpeed = 0;
  var targetAngle;
  var targetY;
  var attackState;
  var nextAttackIdle = 1000;
  setState(STATE_IDLE);

  function setState(newState) {
    bossState = newState;
    stateStartTime = game.time.physicsElapsedTotalMS;

    switch (newState) {
      case STATE_IDLE:
        targetAngle = 0;
        break;

      case STATE_ACID_BALLS_PREPARE:
        nextAttackIdle = game.random.between(1000, 2000);
        targetAngle = game.random.between(-20, 20);
        break;

      case STATE_ACID_BALLS_SHOOT:
        launchAcidBall();
        bossNextState = STATE_SPEAR_ATTACK;
        break;

      case STATE_SNAP_EAT_PREPARE:
        nextAttackIdle = game.random.between(1000, 2000);
        targetY = boss.y - 40;
        break;

      case STATE_SNAP_EAT_RUN:
        targetY = game.world.width - 1;
        bossNextState = STATE_ACID_BALLS_PREPARE;
        break;

      case STATE_SPEAR_ATTACK:
        nextAttackIdle = game.random.between(1000, 2000);
        targetY = boss.y - 40;
        bossNextState = STATE_ACID_BALLS_PREPARE;
        attackState = 1;
        break;
    }
  }

  function moveIdle() {
    if (boss.x < 50) {
      moveSpeedX = 2;
    } else if (boss.x > game.world.width - 150) {
      moveSpeedX = -2;
    }

    if (boss.y > 150) {
      moveSpeedY = -1;
    } else if (boss.y < 0) {
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

    rollForAttack();
  }

  function rollForAttack() {
    const idleTime = game.time.physicsElapsedTotalMS - stateStartTime;
    const isNearCenter = Math.abs(boss.x - game.world.width / 2) < 10;
    const isIncoming = boss.y < 0;

    if (isIncoming) {
      return;
    }

    if (idleTime < 1000) {
      return;
    }

    switch (bossNextState) {
      case STATE_ACID_BALLS_PREPARE:
        if (isNearCenter) {
          setState(STATE_ACID_BALLS_PREPARE);
        }
        break;

      case STATE_SNAP_EAT_PREPARE:
        setState(STATE_SNAP_EAT_PREPARE);
        break;

      case STATE_SPEAR_ATTACK:
        setState(STATE_SPEAR_ATTACK);
        break;
    }
  }

  function moveSpearAttack() {
    if (attackState === 1) {
      moveSpeedY = 0;
      if (boss.y > targetY) {
        boss.y -= 0.5;
      } else {
        boss.y = ownedSprites.y;
        targetY = game.world.height - boss.height - 100;
        moveSpeedY = 15;
        attackState = 2;
      }

      arm3b.angle += 1;
    }

    if (attackState === 2 && boss.y > targetY) {
      moveSpeedY = -2;
      targetY = targetY + 15;
      attackState = 3;
    }

    if (boss.y < game.world.height && arm3b.angle > 0) {
      arm3b.angle -= 1;
    }

    if (attackState === 3 && boss.y < 1) {
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

    if (boss.y < 1) {
      setState(STATE_IDLE);
    }

    boss.y += moveSpeedY;
    ownedSprites.y += moveSpeedY;
  }

  function prepareAcidBalls() {
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
          prepareAcidBalls();
          break;

        case STATE_SNAP_EAT_PREPARE:
          prepareSnapEat();
          break;

        case STATE_SNAP_EAT_RUN:
          moveSnapEat();
          break;

        case STATE_SPEAR_ATTACK:
          moveSpearAttack();
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

  return boss;
}

module.exports = {
  create: function (game) {
    return new Boss1(game);
  }
};
