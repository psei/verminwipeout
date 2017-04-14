'use strict';

var debris;
var config = require('./debris.conf');

function create(game) {
  return function () {
    debris = game.add.sprite(game.world.width / 2, -config.height, config.images.debris);
    game.physics.enable(debris, window.Phaser.Physics.ARCADE);
    debris.anchor.setTo(0.5, 0.5);

    debris.destroysItselfOnHit = true;
    return debris;
  }
}

module.exports = function (game) {
  function move() {
    debris.y += config.speed;
  }

  return {
    create: create(game),
    update: function () {
      if (debris.alive) {
        move();
      }
    }
  };
};
