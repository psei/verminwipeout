'use strict';

var domready = require('domready');

domready(function () {
  var game = new Phaser.Game(1280, 720, Phaser.AUTO, 'Vermin-Wipeout', {
    preload: function ( ) {
      game.load.image('background', '/images/background_v1_2000x4992_repeatable_y.jpg');
    },
    create: function () {
      game.physics.startSystem(Phaser.Physics.P2JS);

      game.state.add('boot', require('./states/boot.js')(game));
      game.state.add('play', require('./states/play.js')(game));
      game.state.start('boot');
    }
  });
});
