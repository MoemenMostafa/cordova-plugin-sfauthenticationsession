Cordova Plugin SFAuthenticationSession
======
By Moamen Mostafa  - [@Moamen Mostafa](linkedin.com/in/moamen-mostafa-4b385713/)
## 1. Description
Cordova Plugin for iOS 11 SFAuthenticationSession API.
## 2. Installation
To install the plugin with the Cordova CLI from npm:

```
$ cordova plugin add cordova-plugin-sfauthenticationsession
```
## 3. Usage

```js
SFAuthSession.start("customScheme://","https://your-oauth-url",function(data){alert(data)})
```

## 4. References
* [Apple Developer - SFAuthenticationSession](https://developer.apple.com/documentation/safariservices/sfauthenticationsession)