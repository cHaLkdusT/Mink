//
//  ErrorDomain.m
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import "ErrorDomain.h"

@implementation ErrorDomain

+ (NSString *)domain {
  return @"com.ewise.ErrorDomain";
}

- (nonnull NSString *)domain {
  return [[self class] domain];
}

+ (nonnull NSError *)errorWithErrorCode:(NSInteger)errorCode {
  return [NSError errorWithDomain:[[self class] domain]
                             code:errorCode
                         userInfo:nil];
}

+ (nonnull NSError *)errorWithErrorCode:(NSInteger)errorCode
                               userInfo:(NSDictionary * _Nonnull)userInfo {
  return [NSError errorWithDomain:[[self class] domain]
                             code:errorCode
                         userInfo:userInfo];
}

@end
