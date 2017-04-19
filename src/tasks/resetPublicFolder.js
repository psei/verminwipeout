'use strict';

var fse = require('fs-extra');
var publicDir = './public';
var vendorDir = `${publicDir}/js/vendor`;

function handleCallback(resolve, reject) {
  return function (err) {
    if (err) {
      console.error(err);
      reject();
    }
    resolve();
  }
}

function cleanPublic() {
  return new Promise(function (resolve, reject) {
    fse.emptyDir(`${publicDir}/`, handleCallback(resolve, reject));
  });
}

function createDir(dir) {
  return new Promise(function (resolve, reject) {
    fse.ensureDir(dir, handleCallback(resolve, reject));
  });
}

function createImagesTargetDirectory() {
  return createDir(`${publicDir}/images`);
}

function createJSTargetDirectories() {
  return createDir(vendorDir);
}

function copy(dirOrFile, target) {
  return new Promise(function (resolve, reject) {
    fse.copy(dirOrFile, target, handleCallback(resolve, reject));
  })
}

function copyImages() {
  return copy(`./assets/images`, `${publicDir}/images`);
}

function copyHtml() {
  return copy(`./client/index.html`, `${publicDir}/index.html`);
}

function copyVendor() {
  return copy(`./node_modules/phaser/build/phaser.js`, `${vendorDir}/phaser.js`);
}

return cleanPublic()
  .then(function () {
    return Promise.all([
      createImagesTargetDirectory().then(copyImages),
      createJSTargetDirectories(),
      copyHtml(),
      copyVendor(),
    ])
  });
