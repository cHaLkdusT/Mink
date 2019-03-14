//
//  MinkError.h
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import <Mink/Mink.h>

NS_ASSUME_NONNULL_BEGIN

@interface MinkError : ErrorDomain

+ (nonnull NSError *)invalidBase64Format;
+ (nonnull NSError *)invalidBase64Format:(NSDictionary * _Nonnull)userInfo;
+ (nonnull NSError *)failedEncryption;
+ (nonnull NSError *)failedEncryption:(NSDictionary * _Nonnull)userInfo;
+ (nonnull NSError *)failedDecryption;
+ (nonnull NSError *)failedDecryption:(NSDictionary * _Nonnull)userInfo;

@end

extern NSString * const MinkErrorDomain;

typedef enum MinkErrorCode {
  MinkErrorCode_InvalidBase64Format = 0,
  MinkErrorCode_FailedEncryption,
  MinkErrorCode_FailedDecryption,
} MinkErrorCode;

NS_ASSUME_NONNULL_END
