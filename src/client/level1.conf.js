'use strict';

var config = require('./baseConfig');
var gameConfig = require('./game.conf');
var times = require('lodash/times');

function yWayPoints(count) {
  return function (startPosition) {
    return times(count, function (i) {
      if (i === 0) {
        return -80;
      }
      if (i === count-1) {
        return gameConfig.height + 80;
      }
      return startPosition.y + row(i, count-2);
    });
  };
}

var wayPoints = {
  straight: function (count) {
    return function (startPosition) {
      return {
        x: times(count, function () {
          return startPosition.x;
        }),
        y: yWayPoints(count)(startPosition)
      };
    };
  },
  zickZack: function (count) {
    return function (startPosition) {
      return {
        x: times(count, function (i) {
          return startPosition.x + (i % 2 ? 0 : 80);
        }),
        y: yWayPoints(count)(startPosition)
      };
    };
  }
};

var formations = {
  horizontal: function (xOffset, xDistance) {
    return function (count) {
      return times(count, function (i) {
        return {
          x: xOffset + i * (xOffset + xDistance),
          y: 0
        };
      });
    }
  },
  vertical: function (xOffset, yDistance) {
    return function (count) {
      return times(count, function (i) {
        return {
          x: xOffset,
          y: i * yDistance
        };
      });
    }
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
  var startPositions = config.formation(config.creatureCount);
  wave.objects = startPositions.map(function (startPos) {
    var waveObj = config.wayPoints(startPos);
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
      formation: formations.horizontal(col(1, 5), 100 * 3.2),
      creatureCount: 3,
      wayPoints: wayPoints.zickZack(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 1,
      durationToReachNextWayPoint: 800,
      formation: formations.vertical(col(2, 5), 80 * 3.2),
      creatureCount: 3,
      wayPoints: wayPoints.straight(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 1000,
      durationToReachNextWayPoint: 1000,
      formation: formations.horizontal(col(3, 5), 80 * 1.2),
      creatureCount: 4,
      wayPoints: wayPoints.zickZack(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 1500,
      durationToReachNextWayPoint: 800,
      formation: formations.horizontal(col(2, 5), 60),
      creatureCount: 3,
      wayPoints: wayPoints.straight(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 2000,
      durationToReachNextWayPoint: 800,
      formation: formations.horizontal(col(4, 5), 60),
      creatureCount: 3,
      wayPoints: wayPoints.straight(4)
    }),

    createEnemyWave({
      type: 'cutterfly',
      spawnTime: 2050,
      durationToReachNextWayPoint: 800,
      formation: formations.horizontal(col(4, 5), 80),
      creatureCount: 3,
      wayPoints: wayPoints.straight(4)
    })
  ]
});
