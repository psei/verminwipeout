'use strict';

var sample = require('lodash/sample');

var config = require('./debris.conf');

function createByFlyAnimation(game, pos, spriteConfig) {
  var flyAnimationName = spriteConfig.animationName;
  var flyAnimationFrames = spriteConfig.frames;
  var debris = game.add.sprite(pos.x, pos.y, flyAnimationName);
  debris.animations.add(flyAnimationName, flyAnimationFrames, spriteConfig.frameRate, true);
  debris.frame = sample(flyAnimationFrames);
  debris.animations.play(flyAnimationName);
  return debris;
}

function Debris(game, pos) {
  var spriteConfig = sample([
    config.sprites.debris,
    config.sprites.debrisInverted
  ]);

  var speed = sample(config.speeds);
  var debris = createByFlyAnimation(game, pos, spriteConfig);
  game.physics.enable(debris, window.Phaser.Physics.ARCADE);
  debris.anchor.setTo(0.5, 0.5);
  debris.destroysItselfOnHit = true;

  function move() {
    debris.y += speed;
  }

  debris.update = function () {
    if (debris.alive) {
      move();
    }
  };

  return debris;
}

module.exports = {
  create: function (game, pos) {
    return new Debris(game, pos);
  }
};
