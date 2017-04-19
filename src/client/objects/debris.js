'use strict';

var sample = require('lodash/sample');

var config = require('./debris.conf');

function Debris(game, pos) {
  var spriteConfig = sample([
    config.sprites.debris,
    config.sprites.debrisInverted
  ]);

  var speed = sample(config.speeds);
  var debris = game.add.sprite(pos.x, pos.y, spriteConfig.animationName);
  game.physics.enable(debris, window.Phaser.Physics.ARCADE);
  debris.anchor.setTo(0.5, 0.5);

  debris.animations.add(spriteConfig.animationName, spriteConfig.frames);
  debris.frame = sample(spriteConfig.frames);
  debris.animations.play(spriteConfig.animationName, spriteConfig.frameRate, true);

  debris.destroysItselfOnHit = true;

  function move() {
    debris.y += speed;
  }

  debris.update = function () {
    if (debris.alive) {
      move();
    }
  };

  debris.playDeathAnimation = function () {
    var explosion = game.add.sprite(debris.body.x, debris.body.y, config.sprites.explode.animationName);
    explosion.anchor.setTo(0.5, 0.5);
    explosion.animations.add(
      config.sprites.explode.animationName);
    explosion.frame = 1;
    explosion.animations.play(config.sprites.explode.animationName,
      config.sprites.explode.frameRate,
      false,
      true);
    debris.kill();
  };

  return debris;
}

module.exports = {
  create: function (game, pos) {
    return new Debris(game, pos);
  }
};
