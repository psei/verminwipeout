'use strict';

var player;

function createPlayer(game) {
  return function () {
    player = game.add.sprite(340, 1200, 'ship');
    game.physics.enable(player, window.Phaser.Physics.ARCADE);
    player.scale.setTo(0.2);
    player.anchor.setTo(0.5, 0.5);
    player.body.collideWorldBounds = true;
    player.weapon = require('./weapon')(game, player);
    return player;
  }
}

module.exports = function (game) {
  var cursors = game.input.keyboard.createCursorKeys();
  var fireButton = game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);

  function move() {
    if (cursors.left.isDown) {
      player.x -= 8;
    } else if (cursors.right.isDown) {
      player.x += 8;
    }

    if (cursors.up.isDown) {
      player.y -= 8;
    } else if (cursors.down.isDown) {
      player.y += 8;
    }
  }

  function fireWeapon() {
    if (fireButton.isDown) {
      player.weapon.fire();
    }
  }

  return {
    create: createPlayer(game),
    update: function () {
      move();
      fireWeapon()
    }
  };
};
