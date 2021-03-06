'use strict';

var config = require('./baseConfig');
var gameConfig = require('./game.conf');
var times = require('lodash/times');

function yWayPoints(count) {
    return function (startPosition) {
        return times(count, function (i) {
            if (i === 0) {
                return -500 + startPosition.y;
            }
            if (i === count - 1) {
                return gameConfig.height + 500 + startPosition.y;
            }
            return startPosition.y + row(i, count - 2);
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
    },
    lurkInFromTopAndOut: function (count) {
        return function (startPosition) {
            return {
                x: times(count, function () {
                    return startPosition.x;
                }),
                y: times(count, function (i) {
                    if (i === count - 1) {
                        return gameConfig.height + 500 + startPosition.y;
                    }
                    return i % 3 === 0 ? startPosition.y - 200 : startPosition.y + 200;
                })
            };
        };
    },
    topRightToBottomLeft: function (count) {
        return function (startPosition) {
            return {
                x: times(count, function (i) {
                    return 400 + startPosition.x - gameConfig.width / count * i - startPosition.y;
                }),
                y: yWayPoints(count)(startPosition).map(function(i) { return i - 400; })
            };
        };
    },
    parableInAndDown: function (count) {
        return function (startPosition) {
            return {
                x: times(count, function (i) {
                    return startPosition.x - gameConfig.width / count * (i + 1);
                }),
                y: times(count, function (i) {
                    if (i === count - 1) {
                        return gameConfig.height + 500 + startPosition.y;
                    }

                    const t = count / 2 - i;
                    const scale = gameConfig.height / (count * count / 4);
                    return gameConfig.height - t * t * scale - 100;
                })
            };
        };
    },
    enterFromRightSideWaysAndStayAWhile: function (count) {
        return function (startPosition) {
            return {
                x: times(count, function(i) {
                    if (i === 0) {
                        return gameConfig.width + 200;
                    }

                    return gameConfig.width - 100;
                }),
                y: times(count, function (i) {
                    if (i === count - 1) {
                        return gameConfig.height + 500 + startPosition.y;
                    }

                    return gameConfig.height / 2 - 400 + startPosition.y;
                })
            };
        };
    },
    fastInSlowDown: function (count) {
        return function (startPosition) {
            return {
                x: times(count, function () {
                    return startPosition.x;
                }),
                y: times(count, function(i) {
                    if (i === 0) {
                        return -500 + startPosition.y;
                    }

                    if (i < 3) {
                        return startPosition.y;
                    }

                    return startPosition.y + gameConfig.height / count * i;
                })
            };
        };
    },
    cube: function (count) {
        return function (startPosition) {
            return {
                x: times(count, function (i) {
                    switch (i % 4) {
                        case 0:
                        case 1:
                            return 600;
                        case 2:
                        case 3:
                            return 200;
                    }
                }),
                y: times(count, function(i) {
                    if (i === 0) {
                        return startPosition.y - 400;
                    }

                    if (count - 1 === i) {
                        return startPosition.y + gameConfig.height / count * i;
                    }

                    switch (i % 4) {
                        case 0:
                        case 3:
                            return startPosition.y + 200;
                        case 1:
                        case 2:
                            return startPosition.y + 400;
                    }


                })
            };
        };
    },
};

var formations = {
    v: function (xOffset, xDistance, yDistance) {
        return function (count) {
            var centerIndex = Math.floor(count / 2);
            return times(count, function (i) {
                return {
                    x: xOffset + i * xDistance,
                    y: -Math.abs(centerIndex - i) * yDistance
                };
            });
        }
    },
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

function createSingleObject(config) {
    var wave = {};
    wave.type = config.type;
    wave.spawnTime = config.spawnTime;
    wave.objects = [config];

    return wave;
}


module.exports = config({
    images: {
        background: '/images/backgrounds/background.jpg',
    },
    backgroundSpeed: 2,
    debrisSpawnRatio: 200,

    waves: [
        createSingleObject({
            type: 'plainImage',
            imageKey: 'station1',
            spawnTime: 0,
            speed: 7,
            offsetX: 0,
            offsetY: 0,
        }),

        createSingleObject({
            type: 'plainImage',
            imageAtlas: 'verminBasics',
            imageFrame: 'interface/tutorials/move-and-shoot.png',
            spawnTime: 0,
            speed: 2,
            offsetX: 200,
            offsetY: 0,
        }),

        createSingleObject({
            type: 'barrier1',
            spawnTime: 2000,
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 4000,
            durationToReachNextWayPoint: 2000,
            formation: formations.horizontal(50, 150),
            creatureCount: 5,
            wayPoints: wayPoints.zickZack(6)
        }),

        createEnemyWave({
            type: 'ghumbo',
            spawnTime: 5500,
            durationToReachNextWayPoint: 2000,
            formation: formations.vertical(50, 150),
            creatureCount: 5,
            wayPoints: wayPoints.straight(6)
        }),

        createSingleObject({
            type: 'plainImage',
            imageAtlas: 'verminBasics',
            imageFrame: 'interface/tutorials/dna.png',
            spawnTime: 0,
            speed: 2,
            offsetX: 200,
            offsetY: 0,
        }),

        createEnemyWave({
            type: 'jizzler',
            spawnTime: 5501,
            durationToReachNextWayPoint: 2000,
            formation: formations.vertical(200, 150),
            creatureCount: 5,
            wayPoints: wayPoints.straight(6)
        }),

        createEnemyWave({
            type: 'sawjaw',
            spawnTime: 6200,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(350, 150),
            creatureCount: 3,
            wayPoints: wayPoints.straight(6)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 6400,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(500, 150),
            creatureCount: 3,
            wayPoints: wayPoints.straight(6)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 6600,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(650, 150),
            creatureCount: 3,
            wayPoints: wayPoints.straight(6)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 8000,
            durationToReachNextWayPoint: 800,
            formation: formations.horizontal(50, 50),
            creatureCount: 8,
            wayPoints: wayPoints.straight(6)
        }),

        createEnemyWave({
            type: 'jizzler',
            spawnTime: 8300,
            durationToReachNextWayPoint: 800,
            formation: formations.horizontal(50, 50),
            creatureCount: 7,
            wayPoints: wayPoints.straight(6)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 8600,
            durationToReachNextWayPoint: 800,
            formation: formations.horizontal(100, 500),
            creatureCount: 2,
            wayPoints: wayPoints.lurkInFromTopAndOut(10)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 8900,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(800, 200),
            creatureCount: 4,
            wayPoints: wayPoints.topRightToBottomLeft(10)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 9200,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(800, 200),
            creatureCount: 1,
            wayPoints: wayPoints.parableInAndDown(10)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 9500,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(800, 200),
            creatureCount: 3,
            wayPoints: wayPoints.enterFromRightSideWaysAndStayAWhile(10)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 9800,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(400, 150),
            creatureCount: 3,
            wayPoints: wayPoints.fastInSlowDown(10)
        }),

        createEnemyWave({
            type: 'cutterfly',
            spawnTime: 9900,
            durationToReachNextWayPoint: 800,
            formation: formations.vertical(400, 150),
            creatureCount: 3,
            wayPoints: wayPoints.cube(10)
        }),

        createSingleObject({
            type: 'boss1',
            spawnTime: 11000,
        }),
    ]
});
