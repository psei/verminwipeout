'use strict';

const LANG_DUTCH = 'dutch';
const LANG_ENGLISH = 'english';
const LANG_GERMAN = 'german';
const LANG_JAPANESE = 'japanese';
const LANG_RUSSIAN = 'russia';
const LANG_SPANISH = 'spanish';

module.exports = function (game) {
  var bg;
  var introBg;
  var goBtnFlySpeed;
  var goBtnLeft;
  var goBtnRight;
  var selectedLanguageBtn;
  var languageSelectGroup;
  var selectedLanguage;
  var hideLanguageAnimation;

  function startGame() {
    game.input.keyboard.onDownCallback = null;
    game.state.start('play');
  }

  function startIntro() {
    game.input.keyboard.onDownCallback = startGame;

    introBg = game.add.sprite(0, 0, 'verminBasics', 'interface/cinematics/intro/0.png');
    introBg.scale.setTo(1.1, 1.1);
    var skipBtn = game.add.button(game.world.width - 60, game.world.height - 60, 'verminBasics', startGame, this, 'interface/buttons/skip.png', 'interface/buttons/skip.png', 'interface/buttons/skip.png', 'interface/buttons/skip.png');
    skipBtn.scale.setTo(0.5, 0.5);
  }

  function prepareGo() {
    goBtnFlySpeed = 1;
  }

  function chooseLanguage(lang, img) {
    selectedLanguage = lang;
    selectedLanguageBtn.setFrames(img, img, img, img);
    if (languageSelectGroup.alpha > 0) {
      hideLanguageAnimation = true;
    } else {
      languageSelectGroup.alpha = 1;
    }
  };

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
      languageSelectGroup = game.add.group();
      var bmd = game.add.bitmapData(game.world.width, game.world.height);
      bmd.ctx.beginPath();
      bmd.ctx.rect(0, 0, game.world.width, game.world.height);
      bmd.ctx.fillStyle = '#340101';
      bmd.ctx.fill();
      languageSelectGroup.create(0, 0, bmd);
      languageSelectGroup.createLanguageBtn = function (offsetY, img, language) {
        const btn = game.add.button(game.world.width / 2, offsetY, 'verminBasics', () => chooseLanguage(language, img), this, img, img, img);
        btn.anchor.setTo(0.5, 0);
        btn.scale.setTo(0.5, 0.5);

        return btn;
      };
      languageSelectGroup.add(languageSelectGroup.createLanguageBtn(80, 'flags/dutch.png', LANG_DUTCH));
      languageSelectGroup.add(languageSelectGroup.createLanguageBtn(230, 'flags/english.png', LANG_ENGLISH));
      languageSelectGroup.add(languageSelectGroup.createLanguageBtn(380, 'flags/german.png', LANG_GERMAN));
      languageSelectGroup.add(languageSelectGroup.createLanguageBtn(530, 'flags/japan.png', LANG_JAPANESE));
      languageSelectGroup.add(languageSelectGroup.createLanguageBtn(680, 'flags/russia.png', LANG_RUSSIAN));
      languageSelectGroup.add(languageSelectGroup.createLanguageBtn(830, 'flags/spain.png', LANG_SPANISH));

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

      goBtnLeft = game.add.sprite(game.world.width / 2 - 95, 680, 'verminStartscreen', 'buttons/go-left.png');
      goBtnLeft.anchor.setTo(0.5, 0);
      goBtnLeft.scale.setTo(0.5, 0.5);
      goBtnLeft.inputEnabled = true;
      goBtnLeft.events.onInputDown.add(prepareGo, this);

      const goText = game.add.text(game.world.width / 2, 658, 'GO', { fill: '#f5af00', fontSize: 61, font: 'Forward' });
      goText.anchor.setTo(0.5, 0);
      goText.inputEnabled = true;
      goText.events.onInputDown.add(prepareGo, this);

      goBtnRight = game.add.sprite(game.world.width / 2 + 90, 680, 'verminStartscreen', 'buttons/go-right.png');
      goBtnRight.anchor.setTo(0.5, 0);
      goBtnRight.scale.setTo(0.5, 0.5);
      goBtnRight.inputEnabled = true;
      goBtnRight.events.onInputDown.add(prepareGo, this);

      selectedLanguageBtn = game.add.button(65, 800, 'verminBasics', chooseLanguage, this, 'flags/english.png', 'flags/english.png', 'flags/english.png');
      selectedLanguageBtn.scale.setTo(0.5, 0.5);

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

      game.world.bringToTop(languageSelectGroup);
    },
    update: function() {
      if (hideLanguageAnimation) {
        languageSelectGroup.alpha = languageSelectGroup.alpha - 0.05;
        if (languageSelectGroup.alpha <= 0) {
          hideLanguageAnimation = false;
        }
      }

      if (goBtnFlySpeed > 0) {
        goBtnLeft.x -= goBtnFlySpeed;
        goBtnRight.x += goBtnFlySpeed;
        goBtnFlySpeed *= 1.1;
        if (goBtnLeft.x <= 4) {
          goBtnFlySpeed = 0;
          startIntro();
        }
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
