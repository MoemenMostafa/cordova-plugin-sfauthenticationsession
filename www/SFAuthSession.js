
var exec = require('cordova/exec');

var PLUGIN_NAME = 'SFAuthSession';

var SFAuthSession = {
  start: function(redirectScheme, requestURL, cb, errorCb) {
    exec(cb, errorCb, PLUGIN_NAME, 'start', [redirectScheme, requestURL]);
  }
};

module.exports = SFAuthSession;
