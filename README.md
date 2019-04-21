Cordova Plugin SFAuthenticationSession
======
By Moamen Mostafa  - [@Moamen Mostafa](linkedin.com/in/moamen-mostafa-4b385713/)
## 1. Description
Cordova Plugin for iOS 11 SFAuthenticationSession API.


## 2. Prerequisites 
 
iOS SDK version 11+ (Important). The build will fail on SDK version 10 and below.
 
## 3. Background
Starting from iOS 11 Apple has stopped the session and cookies sharing between SFSafariViewController and Safari 
Browser and they introduced a new API called SFAuthenticationSession to manage authentications instead.

Before iOS 11 SFSafariViewController was used to accomplish the oAuth authentication but that created a security issue 
where the HTTP redirection happen after successful authentication was vulnerable to be hijacked by another application 
registering the same custom scheme.

Now this vulnerability is mitigated by the new API, SFAuthenticationSession, by 2 things:
1. Asking the user for a permission to allow the application to access a certain domain.
1. capturing the custom scheme redirection and send the location header back to the initiating application regardless 
of the custom scheme. 


## 4. Installation
To install the plugin with the Cordova CLI from npm:

```
$ cordova plugin add cordova-plugin-sfauthenticationsession
```
## 5. Usage
You should detect first that the user is using iOS 11 and then us this plugin.
To do so you should use the **cordova device plugin**

```js
SFAuthSession.start(String([custom-scheme]),String([oAuth-URL]),[CallBack-Function],[errorCallBack-Function])
```
#### example

```js
if (parseInt(device.version) >= 11 && device.platform == "iOS"){
    SFAuthSession.start("customScheme://","https://your-oauth-url",function(data){alert(data)},function(error){alert(error)})
}
```

## 6. References
* [Apple Developer - SFAuthenticationSession](https://developer.apple.com/documentation/safariservices/sfauthenticationsession)
* [iOS 11, Privacy and Single Sign On](https://medium.com/the-traveled-ios-developers-guide/ios-11-privacy-and-single-sign-on-6291687a2ccc)

## 7. License
MIT

The MIT License

Copyright (c) 2019 Moemen Mostafa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
