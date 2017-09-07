
var exec = require('cordova/exec');

var PLUGIN_NAME = 'SFAuthSession';

var SFAuthSession = {
  start: function(redirectScheme, requestURL, cb) {
    exec(cb, null, PLUGIN_NAME, 'start', [redirectScheme, requestURL]);
  }
};

module.exports = SFAuthSession;
