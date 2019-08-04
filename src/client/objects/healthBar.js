'use strict';

var config = require('./healthBar.conf');

function HealthBar(game, player) {
  var ownedSprites = game.add.group();

  var healthBarBackground = game.add.tileSprite(
      game.world.width - config.healthBarWidth,
      config.healthBgPaddingY,
      config.healthBarWidth,
      game.world.height - config.healthBgPaddingY,
      config.images.healthBarBackground
  );
  ownedSprites.add(healthBarBackground);

  var healthBar = game.add.tileSprite(
      game.world.width - 22,
      config.healthPaddingY,
      10,
      game.world.height - config.healthPaddingY,
      config.images.healthBar
  );
  ownedSprites.add(healthBar);

  var lastHealthBlink = 0;
  var healthAlert = game.add.tileSprite(
      game.world.width - 22,
      config.healthPaddingY,
      10,
      game.world.height - config.healthPaddingY,
      config.images.healthAlert
  );
  ownedSprites.add(healthAlert);
  healthAlert.visible = false;

  healthBar.update = function() {
    healthBar.y = config.healthPaddingY - (game.world.height - config.healthPaddingY) * (player.health - 100) / 100;

    if (player.health < 30 && game.time.physicsElapsedTotalMS - lastHealthBlink > 500) {
      healthAlert.visible = !healthAlert.visible;
      lastHealthBlink = game.time.physicsElapsedTotalMS;
    }
  };

  healthBar.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  return healthBar;
}

module.exports = {
  create: function (game, player) {
    return new HealthBar(game, player);
  }
};
