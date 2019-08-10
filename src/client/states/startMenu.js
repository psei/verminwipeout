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

      const title = game.add.image(70, 20, 'verminBasics', 'interface/startscreen/title.png');
      title.scale.setTo(0.5, 0.5);

      const slime = game.add.sprite(70,20, 'verminBasics', 'interface/startscreen/slime/000.png');
      slime.scale.setTo(0.5, 0.5);
      const frames = Phaser.Animation.generateFrameNames('interface/startscreen/slime/', 0, 189, '.png', 3);
      slime.animations.add('slimeAni', frames, 15, true);
      slime.animations.play('slimeAni');


      game.add.text(190, 910, 'Touch to start', { fill: '#f5af00', fontSize: 50, font: 'Forward' });
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
