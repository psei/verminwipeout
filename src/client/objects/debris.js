'use strict';

var config = require('./debris.conf');

function Debris(game) {
  var debris = game.add.sprite(game.world.width / 2, -config.height, config.images.debris);
  game.physics.enable(debris, window.Phaser.Physics.ARCADE);
  debris.anchor.setTo(0.5, 0.5);
  debris.destroysItselfOnHit = true;

  function move() {
    debris.y += config.speed;
  }

  debris.update = function () {
    if (debris.alive) {
      move();
    }
  };

  return debris;
}

module.exports = {
  create: function (game) {
    return new Debris(game);
  }
};
