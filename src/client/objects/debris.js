'use strict';

var config = require('./debris.conf');

var sample = require('lodash/sample');

function Debris(game, pos) {
  var spriteName = sample([
    config.images.debris1,
    config.images.debris2
  ]);

  var debris = game.add.sprite(pos.x, pos.y, spriteName);
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
  create: function (game, pos) {
    return new Debris(game, pos);
  }
};
