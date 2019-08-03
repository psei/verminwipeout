'use strict';

var configs = [
  require('./debris1.conf'),
  require('./debris2.conf')
];

function Debris(game, pos) {
  var ownedSprites = game.add.group();
  var config = game.random.sample(configs);
  var spriteConfig = game.random.sample([
    config.sprites.debris,
    config.sprites.debrisInverted
  ]);

  var speed = game.random.sample(config.speeds);
  var debris = game.add.sprite(pos.x, pos.y, spriteConfig.animationName);
  ownedSprites.add(debris);
  game.physics.enable(debris, window.Phaser.Physics.ARCADE);
  debris.anchor.setTo(0.5, 0.5);

  debris.animations.add(spriteConfig.animationName, spriteConfig.frames);
  debris.frame = game.random.sample(spriteConfig.frames);
  debris.animations.play(spriteConfig.animationName, spriteConfig.frameRate, true);

  debris.destroysItselfOnHit = true;

  debris.getCausedDamagePoints = function() {
    return 0;
  };

  debris.takeBulletHit = function() {
    debris.kill();
  };

  function move() {
    debris.y += speed;

    if (debris.y > game.world.height + 500) {
      debris.destroy();
    }
  }

  debris.update = function () {
    if (debris.alive) {
      move();
    }
  };

  debris.destroy = function() {
    debris.kill();
    ownedSprites.removeAll(true, true);
  };

  function playDeathAnimation() {
    var explosion = game.add.sprite(debris.body.x, debris.body.y, config.sprites.explode.animationName);
    ownedSprites.add(explosion);
    explosion.anchor.setTo(0.5, 0.5);
    explosion.animations.add(
      config.sprites.explode.animationName);
    explosion.frame = 1;
    explosion.animations.play(config.sprites.explode.animationName,
      config.sprites.explode.frameRate,
      false,
      true);
  }

  debris.events.onKilled.add(playDeathAnimation);

  return debris;
}

module.exports = {
  create: function (game, pos) {
    return new Debris(game, pos);
  }
};
