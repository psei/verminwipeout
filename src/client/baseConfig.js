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

module.exports = function (config) {
  config.loadImages = function (game) {
    each(config.images, loadImages(game));
    each(config.sprites, loadSprites(game));
  };
  return config;
};
