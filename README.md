# Mink

[![CI Status](https://img.shields.io/travis/Julius Lundang/Mink.svg?style=flat)](https://travis-ci.org/Julius Lundang/Mink)
[![Version](https://img.shields.io/cocoapods/v/Mink.svg?style=flat)](https://cocoapods.org/pods/Mink)
[![License](https://img.shields.io/cocoapods/l/Mink.svg?style=flat)](https://cocoapods.org/pods/Mink)
[![Platform](https://img.shields.io/cocoapods/p/Mink.svg?style=flat)](https://cocoapods.org/pods/Mink)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Mink is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Mink', :git => 'https://github.com/cHaLkdusT/Mink'
```

## Usage
### Swift
```swift
let key = MinkKey(publicKey: "publicKey", privateKey: "privateKey")
let crypto = try? MinkCrypto(key: key)

let encryptedText = try? crypto?.encryptText("plain text")

let decryptedText = try? crypto?.decryptText("encrypted text")
```
### Objective-C
```objective-c
NSString *publicKey = @"publicKey";
NSString *privateKey = @"privateKey";
MinkKey *key = [[MinkKey alloc] initWithPublicKey:publicKey privateKey:privateKey];
NSError *error;
MinkCrypto *crypto = [[MinkCrypto alloc] initWithKey:key error:&error];

NSString *encryptedText = [crypto encryptText:@"plain text" error:&error];

NSString *decryptedText = [crypto decryptText:@"encrypted text"
                                        error:&error];
```

## Author

Julius Lundang, jwblundang+ios@gmail.com

## License

Mink is available under the MIT license. See the LICENSE file for more info.
