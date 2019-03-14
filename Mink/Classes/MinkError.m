//
//  MinkError.m
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import "MinkError.h"

// apple recommends we use reverse domains
NSString * const MinkErrorDomain = @"com.ewise.MinkErrorDomain";

@implementation MinkError

+ (NSString *)domain {
  return MinkErrorDomain;
}

+ (nonnull NSError *)invalidBase64Format {
  return [self errorWithErrorCode:MinkErrorCode_InvalidBase64Format];
}

+ (nonnull NSError *)invalidBase64Format:(NSDictionary * _Nonnull)userInfo {
  return [self errorWithErrorCode:MinkErrorCode_InvalidBase64Format
                         userInfo:userInfo];
}

+ (nonnull NSError *)failedEncryption {
  return [self errorWithErrorCode:MinkErrorCode_FailedEncryption];
}

+ (nonnull NSError *)failedEncryption:(NSDictionary * _Nonnull)userInfo {
  return [self errorWithErrorCode:MinkErrorCode_FailedEncryption
                         userInfo:userInfo];
}

+ (nonnull NSError *)failedDecryption {
  return [self errorWithErrorCode:MinkErrorCode_FailedDecryption];
}

+ (NSError *)failedDecryption:(NSDictionary *)userInfo {
  return [self errorWithErrorCode:MinkErrorCode_FailedDecryption
                         userInfo:userInfo];
}

@end
