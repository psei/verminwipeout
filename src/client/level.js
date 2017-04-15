'use strict';

var Debris = require('./objects/debris');

function createEnemiesFromWave(game, wave) {
  return wave.objects.map(function (waveObj) {
    return Debris.create(game, waveObj);
  });
}

var levelConfigs = [
  require('./level1.conf.js')
];

function bySpawnAt(a, b) {
  return a.spawnAt - b.spawnAt;
}

function Level(game, levelIndex) {
  var world = game.world;

  this.config = levelConfigs[levelIndex];
  this.waves = this.config.waves.sort(bySpawnAt);
  this.background = game.add.tileSprite(0, 0, world.width, world.height, this.config.images.background);
}

Level.prototype.update = function () {
  this.background.tilePosition.y += this.config.backgroundSpeed;
};

Level.prototype.spawnEnemies = function (game) {
  var enemiesToSpawn = [];
  var nextWaveSpawnY = this.waves.length ? this.waves[0].spawnAt : Infinity;
  if (this.background.tilePosition.y >= nextWaveSpawnY) {
    enemiesToSpawn = createEnemiesFromWave(game, this.waves.shift());
  }
  return enemiesToSpawn;
};

module.exports = {
  init: function (game, currentLevel) {
    return new Level(game, currentLevel - 1);
  }
};
