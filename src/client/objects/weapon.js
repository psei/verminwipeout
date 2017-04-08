'use strict';

var bulletTime = 0;

module.exports = function (game, player) {
  var bullets = game.add.group();
  bullets.enableBody = true;
  bullets.physicsBodyType = Phaser.Physics.ARCADE;
  bullets.createMultiple(30, 'weapon-bullet');
  bullets.setAll('anchor.x', 0.5);
  bullets.setAll('anchor.y', 0);
  bullets.setAll('outOfBoundsKill', true);
  bullets.setAll('checkWorldBounds', true);

  return {
    fire: function () {
      if (game.time.now > bulletTime) {
        var bullet = bullets.getFirstExists(false);
        if (bullet) {
          bullet.reset(player.x, player.y - 362);
          bullet.body.velocity.y = -720;
          bulletTime = game.time.now + 200;
        }
      }
    }
  };
};
