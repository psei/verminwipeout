'use strict';

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
      game.stage.backgroundColor = '#340101';
      game.add.text(32, 32, 'VERMIN WIPEOUT', { fill: '#f5af00', fontSize: 65, font: 'Forward' });
      game.load.image('preload-ship', 'images/preloader/1.png');

      game.scale.fullScreenScaleMode = Phaser.ScaleManager.USER_SCALE;
      game.scale.scaleMode = Phaser.ScaleManager.USER_SCALE;
      scaleGame(window.innerWidth, window.innerHeight);
      window.onresize = function (event) {
        scaleGame(event.target.innerWidth, event.target.innerHeight);
      };
    },
    create: function () {
      game.state.add('boot', require('./boot.js')(game));
      game.state.add('play', require('./play.js')(game));
      game.state.add('startMenu', require('./startMenu.js')(game))
      game.state.start('boot');
    }
  };
};
