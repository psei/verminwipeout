'use strict';

var invokeMap = require('lodash/invokeMap');

var configs = [
  require('../objects/player.conf'),
  require('../objects/splatter.conf'),
  require('../objects/shield.conf'),
  require('../objects/shipThrust.conf'),
  require('../objects/healthBar.conf'),
  require('../objects/gameOver.conf'),
  require('../objects/debris1.conf'),
  require('../objects/debris2.conf'),
  require('../objects/enemies/barrier1.conf'),
  require('../level1.conf.js'),
  require('../objects/weapon1.conf.js'),
  require('../objects/weapon2.conf.js'),
  require('../objects/weapon3.conf.js'),
  require('../objects/plainImage.conf'),
];

module.exports = function (game) {
  var rectangle;
  var subTitle;
  var preloadShip;

  return {
    preload: function () {
      game.stage.backgroundColor = '#340101';
      game.add.text(32, 32, 'VERMIN WIPEOUT', { fill: '#f5af00', fontSize: 65, font: 'Forward' });

      subTitle = game.add.text(game.world.width / 2, 150, 'exterminatrix matrix.exe', { fill: '#f5af00', fontSize: 20, font: 'Forward' });
      subTitle.anchor.setTo(0.5, 0);

      preloadShip = game.add.sprite(game.world.width / 2, game.world.height / 2, 'preload-ship');
      preloadShip.anchor.setTo(0.5, 0.5);

      var width = preloadShip.width;
      var height = preloadShip.height;
      var bmd = game.add.bitmapData(width, height);
      bmd.ctx.beginPath();
      bmd.ctx.rect(0, 0, width, height);
      bmd.ctx.fillStyle = '#340101';
      bmd.ctx.fill();
      rectangle = game.add.sprite(preloadShip.x, preloadShip.y, bmd);
      rectangle.anchor.setTo(0.5, 0.5);

      invokeMap(configs, 'loadMedia', game);
      game.load.audio('music-1-intro', '/audio/music/music-1-intro.wav');
      game.load.audio('music-1-loop', '/audio/music/music-1-loop.wav');
      game.load.audio('boss-intro', '/audio/music/boss-intro.wav');
      game.load.audio('boss-loop', '/audio/music/boss-loop.wav');
      game.load.audio('wiper', '/audio/fx/wiper.mp3');
      game.load.audio('alien-death-0', '/audio/fx/alien-death.wav');
      game.load.audio('alien-death-1', '/audio/fx/alien-death1.wav');
      game.load.atlasJSONHash('verminBasics', 'images/TexturePacker-SmartFolder/verminAtlas0.png', 'images/TexturePacker-SmartFolder/verminAtlas0.json');
      game.load.atlasJSONHash('verminEnemies', 'images/TexturePacker-SmartFolder-Enemies/verminAtlas0.png', 'images/TexturePacker-SmartFolder-Enemies/verminAtlas0.json');
      game.load.atlasJSONHash('verminStartscreen', 'images/TexturePacker-SmartFolder-Startscreen/verminAtlas0.png', 'images/TexturePacker-SmartFolder-Startscreen/verminAtlas0.json');
      game.load.atlasJSONHash('verminShots', 'images/TexturePacker-SmartFolder-Shots/verminAtlas0.png', 'images/TexturePacker-SmartFolder-Shots/verminAtlas0.json');
    },
    create: function () {
      game.stage.backgroundColor = '#F0F0F0';
      game.state.clearCurrentState();
      game.state.start('startMenu');
    },
    loadUpdate: function () {
        rectangle.height = Math.floor(preloadShip.height * (1 - game.load.progress﻿ / 100));
        rectangle.y = preloadShip.y - (preloadShip.height - rectangle.height) / 2;

        if (game.load.progress﻿ > 95) {
          subTitle.setText('kthxbye');
        } else if (game.load.progress > 90) {
          subTitle.setText('done');
        } else if (game.load.progress > 85) {
          subTitle.setText('checking checksum summary');
        } else if (game.load.progress > 80) {
          subTitle.setText('updating meta data calculator');
        } else if (game.load.progress > 75) {
          subTitle.setText('downloading D3FNT1YN0V1RV5F3R5UR3L01FU');
        } else if (game.load.progress > 70) {
          subTitle.setText('purging plutonium redundancy manifold');
        } else if (game.load.progress > 65) {
          subTitle.setText('feeding the droid');
        } else if (game.load.progress > 55) {
          subTitle.setText('generating reconsolidating semi-certainty');
        } else if (game.load.progress > 45) {
          subTitle.setText('modulating atomic transducer thingy');
        } else if (game.load.progress > 40) {
          subTitle.setText('loading screens');
        } else if (game.load.progress > 35) {
          subTitle.setText('calibrating joystick sphereset unit');
        } else if (game.load.progress > 30) {
          subTitle.setText('supercharging hyperdrivers');
        } else if (game.load.progress > 25) {
          subTitle.setText('running stratocubical routines');
        } else if (game.load.progress > 20) {
          subTitle.setText('powering nanocarbon chromite capacitors');
        } else if (game.load.progress > 15) {
          subTitle.setText('gyrating gravitic globules');
        } else if (game.load.progress > 10) {
          subTitle.setText('pre-heating insecticiders');
        } else if (game.load.progress > 5) {
          subTitle.setText('booting audiosexual onboard AI');
        } else {
          subTitle.setText('exterminatrix matrix.exe');
        }
    }
  };
};
