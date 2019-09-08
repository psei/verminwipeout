'use strict';

function Dna(game, player) {
  var ownedSprites = game.add.group();

  var dna = game.add.sprite(0, 0, 'verminEnemies', 'collectables/dna.png');
  dna.visible = false;
  ownedSprites.add(dna);

  dna.handleBulletHitEnemy = function(enemy) {
    if (enemy.alive === false && !enemy.hasSpawnedDna && enemy.givesDna) {
      enemy.hasSpawnedDna = true;
      var enemyDna = game.add.sprite(enemy.x, enemy.y, 'verminEnemies', 'collectables/dna.png');
      game.physics.enable(enemyDna, window.Phaser.Physics.ARCADE);
      ownedSprites.add(enemyDna);
    }
  };

  function collectItem(ref, item) {
    item.destroy();
    ownedSprites.remove(item);
    player.addScore(150);
  }

  dna.checkCollisions = function() {
    game.physics.arcade.overlap(player, ownedSprites, collectItem, function() {}, this);
  };

  return dna;
}

module.exports = {
  create: function (game, player) {
    return new Dna(game, player);
  }
};
