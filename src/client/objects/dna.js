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
      enemyDna.speedX = game.random.between(-100, 100) / 400;
      enemyDna.speedY = game.random.between(0, 100) / 200;
      enemyDna.anchor.setTo(0.5, 0.5);
      enemyDna.update = function() {
        enemyDna.x += enemyDna.speedX;
        enemyDna.y += enemyDna.speedY;
        enemyDna.angle += 0.25;
      };
    }
  };

  function collectItem(ref, item) {
    item.destroy();
    ownedSprites.remove(item);
    player.addScore(150);
  }

  function checkCollisions() {
    game.physics.arcade.overlap(player, ownedSprites, collectItem, function() {}, this);
  }

  dna.update = function () {
    checkCollisions();
    ownedSprites.callAll('update');
    ownedSprites.forEach(function (sprite) {
      const isOutX = sprite.x < -100 || sprite.x > game.world.width + 100;
      const isOutY = sprite.y > game.world.height;
      if (isOutX || isOutY) {
        ownedSprites.remove(sprite);
      }
    });
  };

  return dna;
}

module.exports = {
  create: function (game, player) {
    return new Dna(game, player);
  }
};
