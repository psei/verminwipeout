'use strict';

var domready = require('domready');

domready(function () {
  var gameConfig = require('./game.conf');
  var game = new Phaser.Game(gameConfig.width, gameConfig.height, Phaser.AUTO, gameConfig.name, {
    preload: function ( ) {
      game.load.image('background', '/images/background/background.jpg');
      game.load.image('weapon1-bullet1', '/images/Shots/shot_0_0.png');
    },
    create: function () {
      game.world.setBounds(0, 0, gameConfig.width, gameConfig.height);
      game.state.add('boot', require('./states/boot.js')(game));
      game.state.add('play', require('./states/play.js')(game));
      game.state.start('boot');
    }
  });
});
