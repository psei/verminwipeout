'use strict';

var config = require('./splatter.conf');

function Splatter(game, player) {
  var ownedSprites = game.add.group();

  var wiperSound = game.add.audio('wiper');
  wiperSound.volume = 3;

  var wiper = game.add.tileSprite(game.world.width / 2, game.world.height + 275, 883, 203, config.images.wiperClean);
  wiper.scale.x *= 1.3;
  wiper.scale.y *= 1.3;
  wiper.anchor.set(1.1, 1.1);
  wiper.visible = false;

  var isWiping = false;

  const wipeButton = game.input.keyboard.addKey(Phaser.Keyboard.V);

  /* poor mans swipe detection start */
  var touchStartX = 0;
  var touchStartTime = 0;
  game.input.touch.touchStartCallback = function(event) {
    touchStartX = event.changedTouches[0].pageX;
    touchStartTime = event.timeStamp;
  };
  game.input.touch.touchEndCallback = function(event) {
    const deltaX = event.changedTouches[0].pageX - touchStartX;
    const deltaTime = event.timeStamp - touchStartTime;

    if (deltaTime < 400 && deltaX > 200) {
      startWipe();
    }
  };
  /* poor mans swipe detection end */

  wiper.handleBulletHitEnemy = function(bullet, enemy) {
    if (enemy.givesSplatter && Math.abs(enemy.position.y - player.y) < 350) {
      addSplatter();
    }
  };

  wiper.onEnemyHitsPlayer = function(enemy) {
    if (enemy.givesSplatter && !enemy.gaveSplatterDirectly) {
      enemy.gaveSplatterDirectly = true;
      addSplatter();
    }
  };

  function startWipe() {
    if (isWiping) {
      return;
    }

    wiper.angle = -10;
    wiper.visible = true;
    if (ownedSprites.countLiving() > 0) {
      wiper.loadTexture(config.images.wiperDirty);
    } else {
      wiper.loadTexture(config.images.wiperClean);
    }
    wiperSound.play();
    isWiping = true;
  }

  wiper.update = function() {
    game.world.bringToTop(ownedSprites);

    if (wipeButton.isDown) {
      startWipe();
    }

    if (isWiping) {
      wiper.angle += 1.5;
      if (wiper.angle > 90 && ownedSprites.countLiving() > 0) {
        ownedSprites.removeAll(true, true);
      }
      if (wiper.angle < -10) {
        isWiping = false;
        wiper.visible = false;
      }
    }
  };

  var alienDeath0 = game.add.audio('alien-death-0');
  var alienDeath1 = game.add.audio('alien-death-1');

  function addSplatter() {
    if (ownedSprites.countLiving() > 9000) {
      return;
    }

    if (game.random.between(0, 1) < 0.5) {
      alienDeath0.play();
    } else {
      alienDeath1.play();
    }
    const splatterImagePool = Phaser.Animation.generateFrameNames('splatter/', 0, 9, '.png');
    const selectedImage = Phaser.ArrayUtils.getRandomItem(splatterImagePool);
    const x = game.random.between(-200, game.world.width - 100);
    const y = game.random.between(-200, game.world.height - 100);
    const splatter = game.add.image(x, y, game.findAtlas(selectedImage, game), selectedImage);
    splatter.angle = game.random.between(0, 180);
    ownedSprites.add(splatter);
  }

  wiper.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  return wiper;
}

module.exports = {
  create: function (game, player) {
    return new Splatter(game, player);
  }
};
