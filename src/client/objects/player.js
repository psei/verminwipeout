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
  var player = game.add.sprite(game.world.width / 2, game.world.height - config.height, config.images.ship);
  game.physics.enable(player, window.Phaser.Physics.ARCADE);
  player.anchor.setTo(0.5, 0.5);
  player.body.collideWorldBounds = true;

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
  function move() {
    if (cursors.left.isDown) {
      player.x -= config.speed;
      previousDirection.right = false;
      if (!previousDirection.left) {
        previousDirection.left = true;
        player.loadTexture(config.images.shipLeft)
      }
    } else if (cursors.right.isDown) {
      player.x += config.speed;
      previousDirection.left = false;
      if (!previousDirection.right) {
        previousDirection.right = true;
        player.loadTexture(config.images.shipRight)
      }
    } else if (previousDirection.left || previousDirection.right) {
      player.loadTexture(config.images.ship);
    }

    if (cursors.down.isDown) {
      player.y += config.speed;
      previousDirection.forward = false;
      if (!previousDirection.backward) {
        previousDirection.backward = true;
      }
    } else if (cursors.up.isDown) {
      player.y -= config.speed;
      previousDirection.backward = false;
      if (!previousDirection.forward) {
        previousDirection.forward = true;
      }
    }
  }

  function fireWeapon() {
    if (fireButton.isDown) {
      player.weapon.fire();
    }
  }

  player.update = function () {
    move();
    fireWeapon();
  };

  player.onEnemyHitsPlayer = function (enemy) {
    return function () {
      if (enemy.destroysItselfOnHit) {
        enemy.kill();
      }
    };
  };

  player.switchWeapon = function (index) {
    return function () {
      setWeapon(weaponConfigs[index]);
    };
  };

  var cursors = game.input.keyboard.createCursorKeys();
  var fireButton = game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
  addWeaponSwitchKeyBindings(game, player);

  return player;
}

module.exports = {
  create: function (game) {
    return new Player(game);
  }
};
