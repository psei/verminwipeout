'use strict';

var invokeMap = require('lodash/invokeMap');

var configs = [
  require('../objects/player.conf'),
  require('../objects/debris1.conf'),
  require('../objects/debris2.conf'),
  require('../objects/cutterfly.conf'),
  require('../objects/jizzler.conf'),
  require('../level1.conf.js'),
  require('../objects/weapon1.conf.js'),
  require('../objects/weapon2.conf.js'),
  require('../objects/weapon3.conf.js'),
  require('../objects/station1.conf'),
];

module.exports = function (game) {
  function scaleGame(clientWidth, clientHeight) {
    const originalWidth = 800; // keep in sync with game.conf.js width
    const originalHeight = 1024; // keep in sync with game.conf.js height

    const aspectRatio = originalWidth / originalHeight;

    const widthA = clientWidth;
    var heightA = clientWidth / aspectRatio;
    heightA = heightA > clientHeight ? 0 : heightA;

    var heightB = clientHeight;
    const widthB = clientHeight * aspectRatio;
    heightB = widthB > clientWidth ? 0 : heightB;

    var newHeight;
    var newWidth;

    if (Math.max(heightA, heightB) === 0) {
      newHeight = originalHeight;
      newWidth = originalWidth;
    } else if (heightA > heightB) {
      newHeight = heightA;
      newWidth = widthA;
    } else {
      newHeight = heightB;
      newWidth = widthB;
    }

    game.scale.setUserScale(newWidth / game.width, newHeight / game.height);
  }

  return {
    preload: function () {
      invokeMap(configs, 'loadMedia', game);
      game.load.audio('music-1-intro', '/audio/music/music-1-intro.wav');
      game.load.audio('music-1-loop', '/audio/music/music-1-loop.wav');
      game.load.audio('boss-intro', '/audio/music/boss-intro.wav');
      game.load.audio('boss-loop', '/audio/music/boss-loop.wav');
      game.load.audio('wiper', '/audio/fx/wiper.mp3');

      game.load.image('btn-mute', 'images/interface/btn-mute.png');
      game.load.image('btn-pause', 'images/interface/btn-pause.png');

      game.scale.fullScreenScaleMode = Phaser.ScaleManager.USER_SCALE;
      game.scale.scaleMode = Phaser.ScaleManager.USER_SCALE;
      scaleGame(window.innerWidth, window.innerHeight);
      window.onresize = function (event) {
        scaleGame(event.target.innerWidth, event.target.innerHeight);
      };
    },
    create: function () {
      game.stage.backgroundColor = '#F0F0F0';
      game.state.clearCurrentState();
      game.state.start('play');
    }
  };
};
