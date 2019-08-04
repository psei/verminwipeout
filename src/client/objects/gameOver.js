'use strict';

var config = require('./gameOver.conf');

function GameOver(game, player) {
  var ownedSprites = game.add.group();

  var gameOver = {};

  gameOver.show = function () {
    var widthTop = game.world.width;
    var heightTop = 450;
    var bmdTop = game.add.bitmapData(widthTop, heightTop);
    bmdTop.ctx.beginPath();
    bmdTop.ctx.rect(0, 0, widthTop, heightTop);
    bmdTop.ctx.fillStyle = '#760101';
    bmdTop.ctx.fill();
    const rectTop = game.add.sprite(0, 0, bmdTop);
    ownedSprites.add(rectTop);

    var deathMessages = [
      'BLASTED',
      'FROGGED',
      'PWNT',
      'NUKED',
      'CRUNKT',
      'GAME OVER',
      'THE END',
      'WIPEOUT',
      'YOU ARE DEAD',
      'REST IN PIECES',
      'TOO BAD...',
      'SHREDDED',
    ];
    const selectedMessage = Phaser.ArrayUtils.getRandomItem(deathMessages);
    const text = game.add.text(game.world.width / 2, 100, selectedMessage, {
      fontSize: 50,
      font: 'Aftershok',
      fill: '#000000'
    });
    text.anchor.setTo(0.5, 0.5);
    ownedSprites.add(text);

    const gameOverScreen = game.add.tileSprite(-50, 300, 1920, 1080, config.images.gameOver);
    gameOverScreen.scale.set(0.5, 0.5);
    ownedSprites.add(gameOverScreen);

    var width = game.world.width;
    var height = 270;
    var bmd = game.add.bitmapData(width, height);
    bmd.ctx.beginPath();
    bmd.ctx.rect(0, 0, width, height);
    bmd.ctx.fillStyle = '#6c0101';
    bmd.ctx.fill();
    const rectBottom = game.add.sprite(0, game.world.height - height, bmd);
    ownedSprites.add(rectBottom);

    player.loadTexture(config.images.gameOverShipLife);
    player.loadTexture(config.images.gameOverShipDeath);
    const ship1 = game.add.sprite(150 + 190, game.world.height - 180, config.images.gameOverShipLife);
    ownedSprites.add(ship1);

    const ship2 = game.add.sprite(150 + 220, game.world.height - 180, config.images.gameOverShipLife);
    ownedSprites.add(ship2);

    const ship3 = game.add.sprite(150 + 250, game.world.height - 180, config.images.gameOverShipDeath);
    ownedSprites.add(ship3);

    const textBottom = game.add.text(game.world.width / 2, game.world.height - 150 / 2, 'TOUCH TO CONTINUE', {
      fontSize: 30,
      font: 'Forward',
      fill: '#ff0000'
    });
    textBottom.anchor.setTo(0.5, 0.5);
    ownedSprites.add(textBottom);

    game.world.bringToTop(ownedSprites);

    game.paused = true;
  };

  gameOver.destroy = function () {
    ownedSprites.removeAll(true, true);
  };

  return gameOver;
}

module.exports = {
  create: function (game, player) {
    return new GameOver(game, player);
  }
};
