'use strict';

var config = require('./shield.conf');

function Shield(game, player) {
  var ownedSprites = game.add.group();

  var shield = game.add.sprite(player.body.x, player.body.y, config.sprites.shield.animationName);
  ownedSprites.add(shield);

  shield.anchor.setTo(0.5, 0.5);
  shield.animations.add(config.sprites.shield.animationName);
  shield.visible = false;

  shield.playShieldAnimation = function() {
    if (shield.animations.currentAnim && shield.animations.currentAnim.isPlaying) {
      shield.animations.currentAnim.restart();
      return;
    }

    shield.frame = 1;
    shield.visible = true;
    shield.animations.play(config.sprites.shield.animationName, config.sprites.shield.frameRate, false, false);
  };

  shield.update = function() {
    shield.x = player.x;
    shield.y = player.y;
  };

  shield.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  return shield;
}

module.exports = {
  create: function (game, plyer) {
    return new Shield(game, plyer);
  }
};
