'use strict';

function Barrier1(game) {
  var ownedSprites = game.add.group();

  var barrier = game.add.sprite(0, -250, 'verminBasics', 'barriers/0/0.png');
  ownedSprites.add(barrier);
  game.physics.enable(barrier, window.Phaser.Physics.ARCADE);

  barrier.destroysItselfOnHit = false;
  barrier.health = 40;

  barrier.getCausedDamagePoints = function() {
    return 2;
  };

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

  barrier.takeBulletHit = function(bullet) {
    barrier.health -= bullet.data.bulletManager.causesDamagePoints;
    if (barrier.health < 0) {
      barrier.kill();
    }

    if (barrier.alive) {
      firstBlood(bullet);
    }
  };

  function move() {
    barrier.y += 1;

    if (barrier.y > game.world.height + 500) {
      barrier.destroy();
    }
  }

  barrier.update = function () {
    if (barrier.alive) {
      move();
    }
  };

  barrier.destroy = function() {
    barrier.kill();
    ownedSprites.removeAll(true, true);
  };

  return barrier;
}

module.exports = {
  create: function (game, pos) {
    return new Barrier1(game, pos);
  }
};
