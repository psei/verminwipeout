'use strict';

module.exports = function (game) {
  return {
    preload: function () {
      game.load.image('ship', '/images/ship/ship_0_backward_0.png');
      game.load.image('weapon-bullet', '/images/Shots/shot_0_0.png');
    },
    create: function () {
      game.stage.backgroundColor = '#F0F0F0';
      game.state.clearCurrentState();
      game.state.start('play');
    }
  };
};
