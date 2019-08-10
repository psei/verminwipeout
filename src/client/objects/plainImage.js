'use strict';

var configs = [
  require('./plainImage.conf'),
];

function PlainImage(game, data) {
  const cfg = configs[0];

  const imageKey = data.imageAtlas ? data.imageAtlas : cfg.images[data.imageKey];
  const imageFrame = data.imageFrame ? data.imageFrame : null;

  const plainImage = game.add.sprite(data.offsetX, data.offsetY, imageKey, imageFrame);
  plainImage.anchor.setTo(cfg.anchorX, cfg.anchorY);

  function move() {
    plainImage.y += data.speed;
  }

  plainImage.update = function () {
      move();
  };

  return plainImage;
}

module.exports = {
  create: function (game, type, object) {
    return new PlainImage(game, object);
  }
};
