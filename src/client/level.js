'use strict';

var Debris = require('./objects/debris');
var Enemy = require('./objects/enemy');

function createEnemiesFromWave(game, wave) {
  return wave.objects.map(function (waveObj) {
    var ClassNames = {
      'debris': Debris,
      'enemy': Enemy
    };
    return ClassNames[wave.type].create(game, waveObj);
  });
}

var levelConfigs = [
  require('./level1.conf.js')
];

function Level(game, levelIndex) {
  var world = game.world;

  this.config = levelConfigs[levelIndex];
  this.waves = this.config.waves;
  this.background = game.add.tileSprite(0, 0, world.width, world.height, this.config.images.background);
}

Level.prototype.update = function () {
  this.background.tilePosition.y += this.config.backgroundSpeed;
};

var lastWaveSpawnTime = 0;
Level.prototype.spawnEnemies = function (game) {
  var enemiesToSpawn = [];
  if (this.waves.length) {
    if (lastWaveSpawnTime + this.waves[0].spawnTime <= game.time.physicsElapsedTotalMS) {
      enemiesToSpawn = createEnemiesFromWave(game, this.waves.shift());
      lastWaveSpawnTime = game.time.physicsElapsedTotalMS;
    }
  }
  return enemiesToSpawn;
};

module.exports = {
  init: function (game, currentLevel) {
    return new Level(game, currentLevel - 1);
  }
};
