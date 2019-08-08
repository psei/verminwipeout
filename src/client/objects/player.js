'use strict';

var isEqual = require('lodash/isEqual');

var config = require('./player.conf');
var Weapon = require('./weapon');
var Splatter = require('./splatter');
var Shield = require('./shield');
var ShipThrust = require('./shipThrust');
var HealthBar = require('./healthBar');
var GameOver = require('./gameOver');

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

function Player(game, lifeCounter) {
  var ownedSprites = game.add.group();

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
  game.physics.arcade.setBounds(0, 0, game.world.width, game.world.height);
  player.anchor.setTo(0.5, 0.5);
  player.body.collideWorldBounds = true;
  player.health = 100;

  var splatter = Splatter.create(game, player);
  ownedSprites.add(splatter);

  var shield = Shield.create(game, player);
  var shipThrust = ShipThrust.create(game, player);
  var healthBar = HealthBar.create(game, player);
  var gameOver = GameOver.create(game, player, lifeCounter);

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
    right: true,
    backward: false,
    left: false,
    forwardFrame: 1,
  };

  player.handleBulletHitEnemy = function(bullet, enemy) {
    splatter.handleBulletHitEnemy(bullet, enemy);
  };

  function moveLeft() {
    player.x -= config.speed;
    previousDirection.right = false;
    if (!previousDirection.left) {
      previousDirection.left = true;
      player.loadTexture(config.images.shipLeft);

      if (previousDirection.forward) {
        shipThrust.leftMid();
      } else {
        shipThrust.leftLow();
      }
    }
  }

  function moveRight() {
    player.x += config.speed;
    previousDirection.left = false;
    if (!previousDirection.right) {
      previousDirection.right = true;
      player.loadTexture(config.images.shipRight);

      if (previousDirection.forward) {
        shipThrust.rightMid();
      } else {
        shipThrust.rightLow();
      }
    }
  }

  function moveCenterX() {
    player.loadTexture(config.images.ship);

    previousDirection.left = false;
    previousDirection.right = false;

    if (previousDirection.forward) {
      shipThrust.centerMid();
    } else {
      shipThrust.centerLow();
    }
  }

  function moveUp() {
    player.y -= config.speed;
    previousDirection.backward = false;
    previousDirection.forward = true;

    if (previousDirection.left) {
      shipThrust.leftMid();
    } else if (previousDirection.right) {
      shipThrust.rightMid();
    } else {
      shipThrust.centerMid();
    }
  }

  function moveDown() {
    player.y += config.speed;
    previousDirection.forward = false;
    previousDirection.backward = true;

    if (previousDirection.left) {
      shipThrust.leftLow();
    } else if (previousDirection.right) {
      shipThrust.rightLow();
    } else {
      shipThrust.centerLow();
    }
  }

  function moveCenterY() {
    previousDirection.forward = false;
    previousDirection.backward = false;

    if (previousDirection.left) {
      shipThrust.leftLow();
    } else if (previousDirection.right) {
      shipThrust.rightLow();
    } else {
      shipThrust.centerLow();
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
    } else if (previousDirection.forward || previousDirection.backward) {
      moveCenterY();
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
  }

  function fireWeapon() {
    if (!player.alive) {
      return;
    }

    if (fireButton.isDown || game.input.activePointer.leftButton.isDown || isPermanentFire) {
      player.weapon.fire();
    }
  }

  function playDeathAnimation() {
    var shipDeath = game.add.sprite(0, 0, game.findAtlas('ship/death/0.png'), 'ship/death/0.png');
    ownedSprites.add(shipDeath);

    shipDeath.x = player.x;
    shipDeath.y = player.y;
    shipDeath.scale.setTo(0.5, 0.5);
    shipDeath.anchor.setTo(0.5, 0.5);

    const frames = Phaser.Animation.generateFrameNames('ship/death/', 1, 12, '.png');
    shipDeath.animations.add('shipDieAni', frames, 5, false, false);
    shipDeath.animations.play('shipDieAni');
    shipDeath.animations.currentAnim.onComplete.add(gameOver.show);
  }

  function checkStillAlive() {
    if (player.health <= 0 && player.alive) {
      player.kill();
      shield.destroy();
      shipThrust.destroy();
      splatter.destroy();
      playDeathAnimation();
    }
  }

  player.update = function () {
    move();
    fireWeapon();
    checkStillAlive();
    healthBar.update();
    shield.update();
    shipThrust.update();
    splatter.update();
  };

  player.destroy = function() {
    ownedSprites.removeAll(true, true);
    healthBar.destroy();
    gameOver.destroy();
  };

  player.onEnemyHitsPlayer = function (enemy) {
    return function () {
      shield.playShieldAnimation();
      if (enemy.destroysItselfOnHit) {
        enemy.kill();
      }
      if (enemy.getCausedDamagePoints() > 0 && enemy.hasHitPlayerOnce !== true) {
        const isGodMode = window.location.hash === '#godmode';
        if (!isGodMode) {
          player.setHealth(player.health - enemy.getCausedDamagePoints());
        }
        enemy.hasHitPlayerOnce = true;
      }

      splatter.onEnemyHitsPlayer(enemy);
    };
  };

  player.switchWeapon = function (index) {
    return function () {
      setWeapon(weaponConfigs[index]);
    };
  };

  const touchPointer1 = game.input.pointer1;
  var isPermanentFire = false;
  const cursors = game.input.keyboard.createCursorKeys();
  const fireButton = game.input.keyboard.addKey(Phaser.Keyboard.X);
  game.input.mouse.capture = true;

  addWeaponSwitchKeyBindings(game, player);

  return player;
}

module.exports = {
  create: function (game, lifeCounter) {
    return new Player(game, lifeCounter);
  }
};
