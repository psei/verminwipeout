'use strict';

module.exports = function (game) {
  var bg;
  var bgMove;
  var introBg;

  function startGame() {
    game.input.keyboard.onDownCallback = null;
    game.state.start('play');
  }

  function startIntro() {
    game.input.touch.touchStartCallback = null;
    game.input.keyboard.onDownCallback = startGame;

    introBg = game.add.sprite(0, 0, 'verminBasics', 'interface/cinematics/intro/0.png');
    introBg.scale.setTo(1.1, 1.1);
    var skipBtn = game.add.button(game.world.width - 60, game.world.height - 60, 'verminBasics', startGame, this, 'interface/buttons/skip.png', 'interface/buttons/skip.png', 'interface/buttons/skip.png', 'interface/buttons/skip.png');
    skipBtn.scale.setTo(0.5, 0.5);
  }

  return {
    preload: function () {
      const enemyMapInit = game.add.sprite(0, 0, 'verminEnemies', 'enemies/level1/0-cutterfly/attack/00.png');
      enemyMapInit.scale.setTo(0.01, 0.01);

      game.load.image('startMenuBg', 'images/interface/startscreen.png');
    },
    create: function () {
      bg = game.add.sprite(0, 0, 'startMenuBg');
      bg.scale.y *= 1024 / 1080;
      bgMove = -1;

      const title = game.add.image(70, 20, 'verminBasics', 'interface/startscreen/title.png');
      title.scale.setTo(0.5, 0.5);

      const slime = game.add.sprite(70, 20, 'verminBasics', 'interface/startscreen/slime/000.png');
      slime.scale.setTo(0.5, 0.5);
      const frames = Phaser.Animation.generateFrameNames('interface/startscreen/slime/', 0, 189, '.png', 3);
      slime.animations.add('slimeAni', frames, 15, true);
      slime.animations.play('slimeAni');

      game.add.text(190, 910, 'Touch to start', { fill: '#f5af00', fontSize: 50, font: 'Forward' });
      game.input.touch.touchStartCallback = startIntro;
      game.input.keyboard.onDownCallback = startIntro;
    },
    update: function() {
      bg.x += bgMove;
      if (bg.x + bg.width === game.width) {
        bgMove = +1;
      }
      if (bg.x === 0) {
        bgMove = -1;
      }
      if (introBg) {
        introBg.x -= 1;

        if (introBg.x < -600) {
          startGame();
        }
      }
    }
  };
};
