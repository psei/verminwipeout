'use strict';

var Debris = require('./objects/debris');
var Enemy = require('./objects/enemy');
var Station = require('./objects/station');
const Boss1 = require('./objects/boss1');

function createEnemiesFromWave(game, wave) {
  return wave.objects.map(function (waveObj) {
    var ClassNames = {
      'station1': Station,
      'cutterfly': Enemy,
      'jizzler': Enemy,
      'boss1': Boss1,
    };
    return ClassNames[wave.type].create(game, wave.type, waveObj);
  });
}

var levelConfigs = [
  require('./level1.conf.js')
];

function Level(game, levelIndex) {
  var world = game.world;

  // we need to copy the config for restarts with this Json trick
  this.config = JSON.parse(JSON.stringify(levelConfigs[levelIndex]));
  this.waves = this.config.waves;

  this.background = game.add.tileSprite(0, 0, world.width, world.height, this.config.images.background);
  world.sendToBack(this.background);
}

Level.prototype.update = function () {
  this.background.tilePosition.y += this.config.backgroundSpeed;
};

Level.prototype.destroy = function () {
  this.background.destroy();
  lastWaveSpawnTime = 0;
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
  if (game.random.rollForChancePerSecond(this.config.debrisSpawnRatio)) {
    var debris = Debris.create(game, {
      x: game.random.between(0, game.world.width),
      y: -80
    });
    enemiesToSpawn.push(debris);
  }
  return enemiesToSpawn;
};

module.exports = {
  init: function (game, currentLevel) {
    return new Level(game, currentLevel - 1);
  }
};
