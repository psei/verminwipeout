'use strict';

module.exports = function (game) {
  var bg;
  var bgMove;

  function startGame() {
    game.input.touch.touchStartCallback = null;
    game.input.keyboard.onDownCallback = null;
    game.state.start('play');
  }

  return {
    preload: function () {
      game.load.image('startMenuBg', 'images/interface/startscreen.png');
    },
    create: function () {
      bg = game.add.sprite(0, 0, 'startMenuBg');
      bg.scale.y *= 1024 / 1080;
      bgMove = -1;

      game.add.text(200, 920, 'Touch to start', { fontSize: 65 });
      game.input.touch.touchStartCallback = startGame;
      game.input.keyboard.onDownCallback = startGame;
    },
    update: function() {
      bg.x += bgMove;
      if (bg.x + bg.width === game.width) {
        bgMove = +1;
      }
      if (bg.x === 0) {
        bgMove = -1;
      }
    }
  };
};
