'use strict';

var notifier = require('node-notifier');

notifier.notify({
  title: 'Vermin Wipeout',
  text: process.argv[2]
});
