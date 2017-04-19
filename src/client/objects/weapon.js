'use strict';

module.exports = function (game, player, config) {
  var isAnimated = !!config.sprites;
  var graphicKey = isAnimated ? config.sprites.bullet.animationName : config.images.bullet;

  var weapon = game.add.weapon(config.fireLimit, graphicKey);

  if (isAnimated) {
    var spriteConfig = config.sprites.bullet;
    weapon.bulletFrameCycle = false;
    weapon.addBulletAnimation(spriteConfig.animationName,
      spriteConfig.frames,
      spriteConfig.frameRate,
      false,
      true
    );
  }

  var bulletKillType = Phaser.Weapon.KILL_WORLD_BOUNDS;
  if (config.range) {
    weapon.bulletKillDistance = config.range;
    bulletKillType = Phaser.Weapon.KILL_DISTANCE;
  }
  weapon.bulletKillType = bulletKillType;
  weapon.bulletSpeed = config.bulletSpeed;
  weapon.bulletAngleOffset = 90;
  weapon.fireRate = config.reloadTime;
  weapon.trackSprite(player, 0, 0, false);
  return weapon;
};
