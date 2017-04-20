'use strict';

var each = require('lodash/each');

function loadImages(game) {
  return function (imageSrc) {
    game.load.image(imageSrc, imageSrc);
  };
}

function loadSprites(game) {
  return function (sprite) {
    game.load.spritesheet(sprite.animationName, sprite.imageSrc, sprite.width, sprite.height);
  };
}

function loadSounds(config, game) {
  if (!config.sound) {
    return;
  }
  game.load.audio(config.sound, config.sound);
}

module.exports = function (config) {
  config.loadMedia = function (game) {
    each(config.images, loadImages(game));
    each(config.sprites, loadSprites(game));
    loadSounds(config, game);
  };
  return config;
};
