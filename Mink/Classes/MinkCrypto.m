//
//  MinkCrypto.m
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

@import Tink;

#import "MinkCrypto.h"
#import "MinkError.h"

@implementation MinkCrypto

- (nullable instancetype)initWithKey:(MinkKey * _Nullable)key
                              error:(NSError * _Nullable __autoreleasing * _Nullable)outError {
  self = [super init];
  if (self) {
    NSError *error = nil;
    TINKHybridConfig *config = [[TINKHybridConfig alloc] initWithError:&error];
    if (!config || error) {
      self = nil;
      *outError = error;
      return self;
    }
    
    if (![TINKConfig registerConfig:config error:&error]) {
      self = nil;
      *outError = error;
      return self;
    }
    _key = key;
  }
  
  return self;
}

- (nullable NSString *)encryptText:(NSString * _Nonnull)plainText
                             error:(NSError * _Nullable __autoreleasing *)outError {
  NSString *publicKey = _key.publicKey ? _key.publicKey : @"";
  return [self encryptText:plainText usingKey:publicKey error:outError];
}

- (nullable NSString *)encryptText:(NSString * _Nonnull)plainText
                          usingKey:(NSString * _Nonnull)publicKey
                             error:(NSError * _Nullable __autoreleasing *)outError {
  NSString *cipherText = nil;
  
  NSData *base64Data = [publicKey dataUsingEncoding:NSUTF8StringEncoding];
  NSData *decodedData = [[NSData alloc] initWithBase64EncodedData:base64Data options:NSDataBase64DecodingIgnoreUnknownCharacters];
  
  if (!decodedData) {
    *outError = [MinkError invalidBase64Format];
    return cipherText;
  }
  
  NSError *error = nil;
  TINKJSONKeysetReader *reader = [[TINKJSONKeysetReader alloc] initWithSerializedKeyset:decodedData error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return cipherText;
  }
  
  TINKKeysetHandle *handle = [[TINKKeysetHandle alloc] initCleartextKeysetHandleWithKeysetReader:reader error:&error];
  if (error) {
    if (outError) {
      *outError = [MinkError failedEncryption];
    }
    return cipherText;
  }
  
  id<TINKHybridEncrypt> hybridEncrypt = [TINKHybridEncryptFactory primitiveWithKeysetHandle:handle error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return cipherText;
  }
  
  NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
  NSData *encryptedData = [hybridEncrypt encrypt:plainData withContextInfo:nil error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return cipherText;
  }
  
  cipherText = [encryptedData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
  return cipherText;
}

- (nullable NSString *)decryptText:(NSString * _Nonnull)cipherText
                             error:(NSError * _Nullable __autoreleasing *)outError {
  NSString *privateKey = _key.privateKey ? _key.privateKey : @"";
  return [self decryptText:cipherText usingKey:privateKey error:outError];
}

- (nullable NSString *)decryptText:(NSString * _Nonnull)cipherText
                          usingKey:(NSString * _Nonnull)privateKey
                             error:(NSError * _Nullable __autoreleasing *)outError {
  NSString * plainText = nil;
  
  NSData *base64Data = [privateKey dataUsingEncoding:NSUTF8StringEncoding];
  NSData *decodedData = [[NSData alloc] initWithBase64EncodedData:base64Data options:NSDataBase64DecodingIgnoreUnknownCharacters];
  
  if (!decodedData) {
    *outError = [MinkError invalidBase64Format];
    return plainText;
  }
  
  NSError *error = nil;
  TINKJSONKeysetReader *reader = [[TINKJSONKeysetReader alloc] initWithSerializedKeyset:decodedData error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return plainText;
  }
  
  TINKKeysetHandle *handle = [[TINKKeysetHandle alloc] initCleartextKeysetHandleWithKeysetReader:reader error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return plainText;
  }
  
  id<TINKHybridDecrypt> hybridDecrypt = [TINKHybridDecryptFactory primitiveWithKeysetHandle:handle error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return plainText;
  }
  
  NSData *cipherBase64Data = [cipherText dataUsingEncoding:NSUTF8StringEncoding];
  NSData *cipherData = [[NSData alloc] initWithBase64EncodedData:cipherBase64Data options:NSDataBase64DecodingIgnoreUnknownCharacters];
  if (!cipherData) {
    if (outError) {
      *outError = [MinkError invalidBase64Format];
    }
    return plainText;
  }
  
  NSData *plainData = [hybridDecrypt decrypt:cipherData withContextInfo:nil error:&error];
  if (error) {
    if (outError) {
      *outError = error;
    }
    return plainText;
  }
  
  plainText = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
  return plainText;
}

@end
