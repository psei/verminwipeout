'use strict';

var invokeMap = require('lodash/invokeMap');

var configs = [
  require('../objects/player.conf'),
  require('../objects/debris1.conf'),
  require('../objects/debris2.conf'),
  require('../objects/cutterfly.conf'),
  require('../objects/jizzler.conf'),
  require('../objects/boss1.conf'),
  require('../level1.conf.js'),
  require('../objects/weapon1.conf.js'),
  require('../objects/weapon2.conf.js'),
  require('../objects/weapon3.conf.js'),
  require('../objects/station1.conf'),
];

module.exports = function (game) {
  // from https://stackoverflow.com/questions/4817029/whats-the-best-way-to-detect-a-touch-screen-device-using-javascript
  function isTouchDevice() {
    var prefixes = ' -webkit- -moz- -o- -ms- '.split(' ');
    var mq = function(query) {
      return window.matchMedia(query).matches;
    }

    if (('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch) {
      return true;
    }

    // include the 'heartz' as a way to have a non matching MQ to help terminate the join
    // https://git.io/vznFH
    var query = ['(', prefixes.join('touch-enabled),('), 'heartz', ')'].join('');
    return mq(query);
  }

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

    if (isTouchDevice()) {
      newWidth = clientWidth;
      newHeight = clientHeight;
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
      game.load.atlasJSONHash('shipAtlas', 'images/texturepacker/shipAtlas.png', 'images/texturepacker/shipAtlas.json');
      game.load.atlasJSONHash('splatterAtlas', 'images/texturepacker/splatterAtlas.png', 'images/texturepacker/splatterAtlas.json');
      game.load.atlasJSONHash('bloodAtlas', 'images/texturepacker/bloodAtlas.png', 'images/texturepacker/bloodAtlas.json');

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
