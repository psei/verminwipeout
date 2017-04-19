'use strict';

var config = require('./weapon1.conf');

module.exports = function (game, player) {
  var weapon = game.add.weapon(config.fireLimit, config.images.bullet);

  weapon.bulletKillType = Phaser.Weapon.KILL_WORLD_BOUNDS;
  weapon.bulletSpeed = config.bulletSpeed;
  weapon.bulletAngleOffset = 90;
  weapon.fireRate = config.reloadTime;
  weapon.trackSprite(player, 0, 0, false);
  return weapon;
};
