'use strict';

var config = require('../baseConfig');
module.exports = config({
  images: {
    healthBar: 'images/interface/healthbar-static.png',
    healthAlert: 'images/interface/healthbar-alert.gif',
    healthBarBackground: '/images/interface/healthbar-background.png',
  },
  healthBarWidth: 33,
  healthBgPaddingY: 57, // keep in sync with healthPaddingY
  healthPaddingY: 73, // keep in sync with healthBgPaddingY (healthBgPaddingY + 16)
});
