'use strict';

var each = require('lodash/each');

module.exports = function (config) {
  config.loadImages = function (game) {
    each(config.images, function (imageSrc) {
      game.load.image(imageSrc, imageSrc);
    });
  };
  return config;
};
