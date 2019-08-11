'use strict';

module.exports = function (game) {
  var bg;
  var score;

  function startFight() {
    game.state.start('play');
  }

  return {
    preload: function () {
      game.load.image('trader', 'images/interface/trader.png');
    },
    create: function () {
      bg = game.add.sprite(0, 0, 'trader');
      bg.width = game.world.width;
      bg.height = game.world.height;
      game.add.text(10, 10, 'Killsticks: ' + score + 'c', { fill: '#f5af00', fontSize: 20, font: 'Forward' });

      const fightBtn = game.add.button(game.world.width, game.world.height, 'verminBasics', startFight, this, 'interface/buttons/fullscreen.png', 'interface/buttons/fullscreen.png', 'interface/buttons/fullscreen.png', 'interface/buttons/fullscreen.png');
      fightBtn.anchor.setTo(1,1);
    },
    update: function() {

    },
    init: function(levelScore) {
      score = levelScore;
    }
  };
};
