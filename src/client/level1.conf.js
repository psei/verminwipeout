'use strict';

var config = require('./baseConfig');
var gameConfig = require('./game.conf');
var times = require('lodash/times');

function yWayPoints(count) {
  return times(count, function (i) {
    if (i === 0) {
      return -80;
    }
    if (i === count-1) {
      return gameConfig.height + 80;
    }
    return row(i, count-2);
  });
}

var wayPoints = {
  straight: function (count) {
    return function (x) {
      return {
        x: times(count, function () {
          return x;
        }),
        y: yWayPoints(count)
      };
    };
  },
  zickZack: function (count) {
    return function (x) {
      return {
        x: times(count, function (i) {
          return x + (i % 2 ? 0 : 80);
        }),
        y: yWayPoints(count)
      };
    };
  }
};

function col(which, from) {
  return Math.floor(gameConfig.width / from * (which - 1));
}
function row(which, from) {
  return Math.floor(gameConfig.height / from * (which - 1));
}

function createEnemyWave(config) {
  var wave = {};
  wave.type = config.type;
  wave.spawnTime = config.spawnTime;
  wave.objects = times(config.creatureCount, function (i) {
    var waveObj = config.wayPoints(config.xOffset + i * config.neighborDistance);
    waveObj.time = config.durationToReachNextWayPoint * waveObj.y.length;
    return waveObj;
  });
  return wave;
}


module.exports = config({
  images: {
    background: '/images/backgrounds/background.jpg'
  },
  backgroundWidth: 800,
  backgroundHeight: 1997,
  backgroundSpeed: 2,

  debrisSpawnRatio: 500,

  waves: [

    createEnemyWave({
      type: 'jizzler',
      spawnTime: 1,
      durationToReachNextWayPoint: 4400,
      creatureCount: 4,
      neighborDistance: 100 * 3.2,
      xOffset: col(1, 5),
      wayPoints: wayPoints.zickZack(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 1,
      durationToReachNextWayPoint: 800,
      creatureCount: 3,
      neighborDistance: 80 * 3.2,
      xOffset: col(2, 5),
      wayPoints: wayPoints.straight(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 1000,
      durationToReachNextWayPoint: 1000,
      creatureCount: 4,
      neighborDistance: 80 * 1.2,
      xOffset: col(3, 5),
      wayPoints: wayPoints.zickZack(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 1500,
      durationToReachNextWayPoint: 800,
      creatureCount: 3,
      neighborDistance: 60,
      xOffset: col(2, 5),
      wayPoints: wayPoints.straight(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 2000,
      durationToReachNextWayPoint: 800,
      creatureCount: 3,
      neighborDistance: 60,
      xOffset: col(4, 5),
      wayPoints: wayPoints.straight(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 2050,
      durationToReachNextWayPoint: 800,
      creatureCount: 3,
      neighborDistance: 80,
      xOffset: col(4, 5),
      wayPoints: wayPoints.straight(4)
    })
  ]
});
