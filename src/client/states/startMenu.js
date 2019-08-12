'use strict';

module.exports = function (game) {
  var bg;
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

  function chooseLanguage() {

  }

  function showCredits() {

  }

  function share() {
    if (navigator.share !== undefined) {
      navigator.share({
        title: 'Vermin Wipeout',
        text: 'Check out this cool game!',
        url: window.location.href
      });
    } else {
      // todo?
    }
  }

  function goToWebsite() {
    window.open('https://verminwipeout.com');
  }

  return {
    preload: function () {
      const enemyMapInit = game.add.sprite(0, 0, 'verminEnemies', 'enemies/level1/0-cutterfly/attack/00.png');
      enemyMapInit.scale.setTo(0.01, 0.01);

      game.load.image('startMenuBg', 'images/interface/startscreen.png');
    },
    create: function () {
      bg = game.add.sprite(0, 0, 'startMenuBg');
      bg.scale.x *= 800 / 1440;
      bg.scale.y *= 800 / 1440;

      const title = game.add.image(50, 150, 'verminStartscreen', 'title.png');
      title.scale.setTo(1.4, 1.4);

      const slime = game.add.sprite(0, 0, 'verminStartscreen', 'slime/000.png');
      slime.scale.setTo(0.6, 0.6);
      const frames = Phaser.Animation.generateFrameNames('slime/', 0, 144, '.png', 3);
      slime.animations.add('slimeAni', frames, 15, true);
      slime.animations.play('slimeAni');

      const ship = game.add.sprite(game.world.width / 2, 400, 'verminStartscreen', 'ship/0.png');
      ship.anchor.setTo(0.5, 0);
      const shipFrames = Phaser.Animation.generateFrameNames('ship/', 0, 7, '.png');
      ship.animations.add('shipRotation', shipFrames, 2, true);
      ship.animations.play('shipRotation');

      const goLeftBtn = game.add.sprite(game.world.width / 2 - 95, 680, 'verminStartscreen', 'buttons/go-left.png');
      goLeftBtn.anchor.setTo(0.5, 0);
      goLeftBtn.scale.setTo(0.5, 0.5);

      const goText = game.add.text(game.world.width / 2, 658, 'GO', { fill: '#f5af00', fontSize: 61, font: 'Forward' });
      goText.anchor.setTo(0.5, 0);

      const goRightBtn = game.add.sprite(game.world.width / 2 + 90, 680, 'verminStartscreen', 'buttons/go-right.png');
      goRightBtn.anchor.setTo(0.5, 0);
      goRightBtn.scale.setTo(0.5, 0.5);

      const languageBtn = game.add.button(65, 800, 'verminBasics', chooseLanguage, this, 'flags/english.png', 'flags/english.png', 'flags/english.png');
      languageBtn.scale.setTo(0.5, 0.5);

      const creditsBtn = game.add.sprite(255, 800, 'verminStartscreen', 'buttons/btn-blank.png');
      creditsBtn.scale.setTo(0.5, 0.5);
      const creditsIcon = game.add.button(255, 800, 'verminStartscreen', showCredits, this, 'buttons/team.png', 'buttons/team.png', 'buttons/team.png');
      creditsIcon.scale.setTo(0.5, 0.5);

      const shareBtn = game.add.sprite(445, 800, 'verminStartscreen', 'buttons/btn-blank.png');
      shareBtn.scale.setTo(0.5, 0.5);
      const shareIcon = game.add.button(445, 800, 'verminStartscreen', share, this, 'buttons/share.png', 'buttons/share.png', 'buttons/share.png');
      shareIcon.scale.setTo(0.5, 0.5);

      const websiteBtn = game.add.sprite(635, 800, 'verminStartscreen', 'buttons/btn-blank.png');
      websiteBtn.scale.setTo(0.5, 0.5);
      const websiteIcon = game.add.button(635, 800, 'verminStartscreen', goToWebsite, this, 'buttons/website.png', 'buttons/website.png', 'buttons/website.png');
      websiteIcon.scale.setTo(0.5, 0.5);

      const lowText1 = game.add.text(game.world.width / 2, 925, 'Intergalactic uber critter extermination for fun and profit', { fill: '#f5af00', fontSize: 18, font: 'Forward' });
      const lowText2 = game.add.text(game.world.width / 2, 970, 'by Norman von Rechenberg & David Edler', { fill: '#f5af00', fontSize: 18, font: 'Forward' });
      lowText1.anchor.setTo(0.5, 0);
      lowText2.anchor.setTo(0.5, 0);

      game.input.touch.touchStartCallback = startIntro;
      game.input.keyboard.onDownCallback = startIntro;
    },
    update: function() {
      if (introBg) {
        introBg.x -= 1;

        if (introBg.x < -600) {
          startGame();
        }
      }
    }
  };
};
