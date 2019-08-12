'use strict';

var Debris = require('./objects/debris');
var Enemy = require('./objects/enemies/enemy');
var PlainImage = require('./objects/plainImage');
const Boss1 = require('./objects/enemies/boss1');
const Barrier1 = require('./objects/enemies/barrier1');

function createEnemiesFromWave(game, wave) {
  return wave.objects.map(function (waveObj) {
    var ClassNames = {
      'plainImage': PlainImage,
      'cutterfly': Enemy,
      'jizzler': Enemy,
      'sawjaw': Enemy,
      'ghumbo': Enemy,
      'boss1': Boss1,
      'barrier1': Barrier1,
    };
    return ClassNames[wave.type].create(game, wave.type, waveObj);
  });
}

var levelConfigs = [
  require('./level1.conf.js')
];

function Level(game, levelIndex) {
  var world = game.world;
  this.isBgMoving = true;

  // we need to copy the config for restarts with this Json trick
  this.config = JSON.parse(JSON.stringify(levelConfigs[levelIndex]));
  this.waves = this.config.waves;

  this.background = game.add.tileSprite(0, 0, world.width, world.height, this.config.images.background);
  this.background.scale.setTo(1.6, 1.6)
  world.sendToBack(this.background);
}

Level.prototype.update = function () {
  if (this.isBgMoving) {
    this.background.tilePosition.y += this.config.backgroundSpeed;
  }
};

Level.prototype.stopBackground = function() {
  this.isBgMoving = false;
};

Level.prototype.startBackground = function() {
  this.isBgMoving = true;
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

Level.prototype.spawnFinalStation = function(game) {
  return PlainImage.create(game, 'station2', {
    imageKey: 'station2',
    speed: 3,
    offsetX: 0,
    offsetY: -1500,
  });
};

module.exports = {
  init: function (game, currentLevel) {
    return new Level(game, currentLevel - 1);
  }
};
