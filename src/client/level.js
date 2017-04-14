'use strict';

var levelConfigs = [
  require('./level1.conf.js')
];

function Level(game, levelIndex) {
  var world = game.world;

  this.config = levelConfigs[levelIndex];
  this.background = game.add.tileSprite(0, 0, world.width, world.height, this.config.images.background);
}

Level.prototype.update = function () {
  this.background.tilePosition.y += this.config.backgroundSpeed;
};

module.exports = {
  init: function (game, currentLevel) {
    return new Level(game, currentLevel - 1);
  }
};
