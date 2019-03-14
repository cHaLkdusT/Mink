//
//  MinkKey.h
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MinkKey : NSObject

@property (strong, nonatomic, readonly, nonnull) NSString *publicKey;
@property (strong, nonatomic, readonly, nonnull) NSString *privateKey;

/**
 Initializes a MinkKey

 @param publicKey String public key
 @param privateKey String private key
 @return A MinkKey object
 */
- (nonnull instancetype)initWithPublicKey:(NSString * _Nonnull)publicKey
                               privateKey:(NSString * _Nonnull)privateKey;

@end

NS_ASSUME_NONNULL_END
