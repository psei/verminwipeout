'use strict';

var config = require('./enemy.conf');

function Enemy(game, pos) {
  var spriteConfig = config.sprites.enemy;

  var speed = config.speed;
  var enemy = game.add.sprite(pos.x, pos.y, spriteConfig.animationName);
  game.physics.enable(enemy, window.Phaser.Physics.ARCADE);
  enemy.anchor.setTo(0.5, 0.5);

  enemy.animations.add(spriteConfig.animationName);
  enemy.frame = 1;
  enemy.animations.play(spriteConfig.animationName, spriteConfig.frameRate, true);

  function move() {
    enemy.y += speed;
  }

  enemy.update = function () {
    if (enemy.alive) {
      move();
    }
  };

  function playDeathAnimation() {
    var deathConfig = config.sprites.death;
    var death = game.add.sprite(enemy.body.x, enemy.body.y, deathConfig.animationName);
    death.anchor.setTo(0.5, 0.5);
    death.animations.add(
      deathConfig.animationName);
    death.frame = 1;
    death.animations.play(deathConfig.animationName,
      deathConfig.frameRate,
      false,
      true);
  }

  enemy.events.onKilled.add(playDeathAnimation);

  return enemy;
}

module.exports = {
  create: function (game, pos) {
    return new Enemy(game, pos);
  }
};
