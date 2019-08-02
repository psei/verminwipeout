'use strict';

var isEqual = require('lodash/isEqual');

var config = require('./player.conf');
var Weapon = require('./weapon');

var weaponConfigs = [
  require('./weapon1.conf'),
  require('./weapon2.conf'),
  require('./weapon3.conf')
];

function addWeaponSwitchKeyBindings(game, player) {
  var keyCodes = [
    Phaser.Keyboard.ONE,
    Phaser.Keyboard.TWO,
    Phaser.Keyboard.THREE
  ];

  keyCodes.map(function (keyCode, i) {
    var key = game.input.keyboard.addKey(keyCode);
    key.onDown.add(player.switchWeapon(i), player);
  });
}

function Player(game) {
  var ownedSprites = game.add.group();
  var splatterOnScreen = game.add.group();

  var player = game.add.sprite(game.world.width / 2, game.world.height - config.height, config.images.ship);
  ownedSprites.add(player);
  player.hitArea = new Phaser.Polygon([
    new Phaser.Point(41, 90),
    new Phaser.Point(78, 65),
    new Phaser.Point(78, 59),
    new Phaser.Point(38, 15),
    new Phaser.Point(28, 0),
    new Phaser.Point(20, 35),
    new Phaser.Point(0, 60),
    new Phaser.Point(0, 65),
  ]);

  game.physics.enable(player, window.Phaser.Physics.ARCADE);
  game.physics.arcade.setBounds(0, 0, game.world.width - config.interfaceWidth, game.world.height);
  player.anchor.setTo(0.5, 0.5);
  player.body.collideWorldBounds = true;

  var lastHealthBlink = 0;
  player.health = 100;
  var healthAlert = game.add.tileSprite(
      game.world.width - 22,
      config.healthPaddingY,
      10,
      game.world.height - config.healthPaddingY,
      config.images.healthAlert
  );
  ownedSprites.add(healthAlert);
  healthAlert.visible = false;

  var healthBar = game.add.tileSprite(
      game.world.width - 22,
      config.healthPaddingY,
      10,
      game.world.height - config.healthPaddingY,
      config.images.healthBar
  );
  ownedSprites.add(healthBar);

  var shield = game.add.sprite(player.body.x, player.body.y, config.sprites.shield.animationName);
  ownedSprites.add(shield);
  shield.anchor.setTo(0.5, 0.5);
  shield.animations.add(config.sprites.shield.animationName);
  shield.visible = false;

  function playShieldAnimation() {
    shield.frame = 1;
    shield.visible = true;
    shield.animations.play(config.sprites.shield.animationName,
      config.sprites.shield.frameRate,
      false,
      false);
  }

  function setWeapon(weaponConfig) {
    if (isEqual(weaponConfig, player.currentWeaponConfig)) {
      return;
    }
    player.currentWeaponConfig = weaponConfig;
    player.weapon = Weapon.create(game, player, weaponConfig);
  }
  setWeapon(weaponConfigs[0]);

  var previousDirection = {
    forward: false,
    right: false,
    backward: false,
    left: false
  };

  function moveLeft() {
    player.x -= config.speed;
    previousDirection.right = false;
    if (!previousDirection.left) {
      previousDirection.left = true;
      player.loadTexture(config.images.shipLeft);
    }
  }

  function moveRight() {
    player.x += config.speed;
    previousDirection.left = false;
    if (!previousDirection.right) {
      previousDirection.right = true;
      player.loadTexture(config.images.shipRight);
    }
  }

  function moveCenterX() {
    player.loadTexture(config.images.ship);
  }

  function moveUp() {
    player.y -= config.speed;
    previousDirection.backward = false;
    if (!previousDirection.forward) {
      previousDirection.forward = true;
    }
  }

  function moveDown() {
    player.y += config.speed;
    previousDirection.forward = false;
    if (!previousDirection.backward) {
      previousDirection.backward = true;
    }
  }

  function move() {
    if (cursors.left.isDown) {
      moveLeft();
    } else if (cursors.right.isDown) {
      moveRight();
    } else if (previousDirection.left || previousDirection.right) {
      moveCenterX();
    }

    if (cursors.down.isDown) {
      moveDown();
    } else if (cursors.up.isDown) {
      moveUp();
    }

    //touch
    if (touchPointer1.isDown) {
      isPermanentFire = true;

      const touchX = touchPointer1.position.x;
      const touchY = touchPointer1.position.y;

      if (player.x > touchX) {
        moveLeft();
      } else {
        moveRight();
      }

      if (player.y > touchY) {
        moveUp();
      } else {
        moveDown();
      }
    }

    shield.x = player.x;
    shield.y = player.y;
  }

  function fireWeapon() {
    if (fireButton.isDown || isPermanentFire) {
      player.weapon.fire();
    }
  }

  function wipeStuff() {
    if (wipeButton.isDown && !isWiping) {
      wiper.angle = -180;
      wiperAngleVelocity = 2;
      wiper.visible = true;
      isWiping = true;
    }

    if (isWiping) {
      wiper.angle += wiperAngleVelocity;
      if (wiperAngleVelocity === 2 && wiper.angle > -90) {
        splatterOnScreen.removeAll(true, true);
      }
      if (wiper.angle > 10) {
        wiperAngleVelocity = -2;
      }
      if (wiper.angle > 20) {
        isWiping = false;
        wiper.visible = false;
      }
    }
  }

  function emptyHealth() {
    ownedSprites.removeAll(true, true);

    var deathMessages = [
      config.images.deathMessage1,
      config.images.deathMessage2,
      config.images.deathMessage3,
      config.images.deathMessage4,
      config.images.deathMessage5,
      config.images.deathMessage6,
      config.images.deathMessage7,
      config.images.deathMessage8,
      config.images.deathMessage9,
      config.images.deathMessage10,
      config.images.deathMessage11,
      config.images.deathMessage12,
      config.images.deathMessage13,
    ];
    var selectedMessage = Phaser.ArrayUtils.getRandomItem(deathMessages);
    const gameOverScreen = game.add.tileSprite(-560, 0, 1920, 1080, config.images.gameOver);
    ownedSprites.add(gameOverScreen);
    const gameOverText = game.add.tileSprite(0, 0, game.world.width, 111, selectedMessage);
    ownedSprites.add(gameOverText);
    game.world.bringToTop(ownedSprites);

    game.paused = true;
  }

  function healthStuff() {
    if (player.health < 0 && player.alive) {
      emptyHealth();
    }

    healthBar.y = config.healthPaddingY - (game.world.height - config.healthPaddingY) * (player.health - 100) / 100;

    if (player.health < 30 && game.time.physicsElapsedTotalMS - lastHealthBlink > 500) {
      healthAlert.visible = !healthAlert.visible;
      lastHealthBlink = game.time.physicsElapsedTotalMS;
    }
  }

  player.update = function () {
    move();
    fireWeapon();
    healthStuff();
    wipeStuff();
  };

  player.destroy = function() {
    ownedSprites.removeAll(true, true);
  };

  var wiper = game.add.tileSprite(game.world.width / 2, game.world.height - 124, 800, 124, config.images.wiper);
  ownedSprites.add(wiper);

  wiper.anchor.set(.5, .5);
  wiper.scale.x *= -1;

  wiper.anchor.setTo(1.1, 1.1);

  wiper.visible = false;
  var isWiping = false;
  var wiperAngleVelocity = 2;

  player.onEnemyHitsPlayer = function (enemy) {
    return function () {
      playShieldAnimation();
      if (enemy.destroysItselfOnHit) {
        enemy.kill();
      }
      if (enemy.getHitPoints() > 0 && enemy.hasHitPlayerOnce !== true) {
        player.setHealth(player.health - enemy.getHitPoints());
        enemy.hasHitPlayerOnce = true;

        // splatter
        if (Math.abs(enemy.position.y - player.position.y) < enemy.height) {
          const splatterImages = [
            config.images.splatter1,
            config.images.splatter2,
            config.images.splatter3,
            config.images.splatter4,
            config.images.splatter5,
            config.images.splatter6,
            config.images.splatter7,
            config.images.splatter8,
            config.images.splatter9,
            config.images.splatter10,
            config.images.splatter11,
            config.images.splatter12,
            config.images.splatter13,
            config.images.splatter14,
            config.images.splatter15,
            config.images.splatter16,
            config.images.splatter17,
            config.images.splatter18,
            config.images.splatter19,
            config.images.splatter20,
            config.images.splatter21,
            config.images.splatter22,
            config.images.splatter23,
            config.images.splatter24,
            config.images.splatter25,
            config.images.splatter26,
            config.images.splatter27,
            config.images.splatter28,
            config.images.splatter29,
            config.images.splatter30,
            config.images.splatter31,
            config.images.splatter32,
            config.images.splatter33,
            config.images.splatter34,
            config.images.splatter35,
          ];
          const selectedImage = Phaser.ArrayUtils.getRandomItem(splatterImages);
          const splatter = game.add.tileSprite(0, 0, game.world.width, game.world.height, selectedImage);
          splatterOnScreen.add(splatter);
          ownedSprites.add(splatter);
        }
      }
    };
  };

  player.switchWeapon = function (index) {
    return function () {
      setWeapon(weaponConfigs[index]);
    };
  };

  var touchPointer1 = game.input.pointer1;
  var isPermanentFire = false;
  var cursors = game.input.keyboard.createCursorKeys();
  var fireButton = game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
  var wipeButton = game.input.keyboard.addKey(Phaser.Keyboard.V);
  addWeaponSwitchKeyBindings(game, player);

  return player;
}

module.exports = {
  create: function (game) {
    return new Player(game);
  }
};
