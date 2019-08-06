'use strict';

var domready = require('domready');

domready(function () {
  var gameConfig = require('./game.conf');
  var game = new Phaser.Game(gameConfig.width, gameConfig.height, Phaser.AUTO, gameConfig.name, {
    preload: function () {},
    create: function () {
      game.random = new Phaser.RandomDataGenerator(gameConfig.seeds);
      game.random.sample = function (array) {
        return array[game.random.between(0, array.length - 1)];
      };
      game.random.rollForChancePerSecond = function (percentage) {
        if (game.random.between(1, 100) > percentage) {
          return false;
        }
        return game.random.between(1, 60) === 1;
      };

      game.world.setBounds(0, 0, gameConfig.width, gameConfig.height);
      game.state.add('preBoot', require('./states/preBoot.js')(game));
      game.state.start('preBoot');
    }
  });
});
