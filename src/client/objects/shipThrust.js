'use strict';

var config = require('./shipThrust.conf');

function ShipThrust(game, player) {
  var ownedSprites = game.add.group();
  var shipThrust = game.add.sprite(0, 0, config.sprites.shipThrustLeftLow.animationName);
  ownedSprites.add(shipThrust);

  function thrustAnimation(sprite, anchorX, anchorY) {
    if (!player.alive) {
      shipThrust.visible = false;
      return;
    }

    ownedSprites.remove(shipThrust);
    shipThrust.destroy(true);
    shipThrust = game.add.sprite(0, 0, sprite.animationName);
    ownedSprites.add(shipThrust);
    shipThrust.x = player.x;
    shipThrust.y = player.y;
    shipThrust.width = player.width + 75;
    shipThrust.height = player.height + 180;
    shipThrust.anchor.setTo(anchorX, anchorY);
    shipThrust.animations.add(sprite.animationName, sprite.frames);
    shipThrust.frame = 1;
    shipThrust.animations.play(sprite.animationName, sprite.frameRate, true, false);
  }

  shipThrust.leftLow = function () {
    thrustAnimation(config.sprites.shipThrustLeftLow, 0.3, 0.2);
  };

  shipThrust.leftMid = function () {
    thrustAnimation(config.sprites.shipThrustLeftMid, 0.3, 0.2);
  };

  shipThrust.rightLow = function () {
    thrustAnimation(config.sprites.shipThrustRightLow, 0.7, 0.2);
  };

  shipThrust.rightMid = function () {
    thrustAnimation(config.sprites.shipThrustRightMid, 0.7, 0.2);
  };

  shipThrust.centerLow = function () {
    thrustAnimation(config.sprites.shipThrustCenterLow, 0.3, 0.2);
  };

  shipThrust.centerMid = function () {
    thrustAnimation(config.sprites.shipThrustCenterMid, 0.3, 0.2);
  };

  shipThrust.update = function() {
    shipThrust.x = player.x;
    shipThrust.y = player.y;
  };

  shipThrust.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  return shipThrust;
}

module.exports = {
  create: function (game, player) {
    return new ShipThrust(game, player);
  }
};
