//
//  MinkCrypto.h
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import <Foundation/Foundation.h>

#import "MinkKey.h"

NS_ASSUME_NONNULL_BEGIN

@interface MinkCrypto : NSObject

@property (strong, nonatomic) MinkKey * _Nullable key;

- (nullable instancetype)initWithKey:(MinkKey * _Nullable)key
                              error:(NSError * _Nullable __autoreleasing * _Nullable)error;

/**
 Encrypt a plain text

 @param plainText Plain text
 @param outError invalidBase64Format, failedEncryption
 @return Encrypted string
 */
- (nullable NSString *)encryptText:(NSString * _Nonnull)plainText
                             error:(NSError * __autoreleasing *)outError;

/**
 Encrypt a plain text

 @param plainText Plain text
 @param publicKey Public key in base64 format
 @param outError invalidBase64Format, failedEncryption
 @return Encrypted string
 */
- (nullable NSString *)encryptText:(NSString * _Nonnull)plainText
                          usingKey:(NSString * _Nonnull)publicKey
                             error:(NSError * __autoreleasing *)outError;

/**
 Decrypt an encrypted text

 @param cipherText Encrypted text
 @param outError invalidBase64Format, failedDecryption
 @return Decrypted string
 */
- (nullable NSString *)decryptText:(NSString * _Nonnull)cipherText
                             error:(NSError * __autoreleasing *)outError;

/**
 Decrypt an encrypted text

 @param cipherText Encrypted text
 @param privateKey Private key in base64 format
 @param outError invalidBase64Format, failedDecryption
 @return Decrypted string
 */
- (nullable NSString *)decryptText:(NSString * _Nonnull)cipherText
                          usingKey:(NSString * _Nonnull)privateKey
                             error:(NSError * __autoreleasing *)outError;

@end

NS_ASSUME_NONNULL_END
