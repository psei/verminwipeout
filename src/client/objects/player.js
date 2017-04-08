'use strict';

var player;

module.exports = function (game) {
  return {
    create: function () {
      player = game.add.sprite(340, 1200, 'ship');
      game.physics.enable(player, window.Phaser.Physics.ARCADE);
      player.scale.setTo(0.2);
      player.body.collideWorldBounds = true;
      return player;
    },
    update: function (player, cursors) {
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
  };
};
