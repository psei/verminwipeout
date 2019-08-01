'use strict';

var configs = [
  require('./station1.conf'),
];

function Station(game) {
  const cfg = configs[0];

  const station = game.add.sprite(cfg.posX, cfg.posY, cfg.images.base);
  station.anchor.setTo(cfg.anchorX, cfg.anchorY);

  function move() {
    station.y += cfg.speed;
  }

  station.update = function () {
      move();
  };

  return station;
}

module.exports = {
  create: function (game) {
    return new Station(game);
  }
};
