//
//  ErrorDomain.h
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ErrorDomain : NSObject

+ (nonnull NSString *)domain; // << required override
- (nonnull NSString *)domain; // << returns [[self class] domain]

// example convenience methods:
// uses [self domain]
+ (nonnull NSError *)errorWithErrorCode:(NSInteger)errorCode; // << user info would be nil
+ (nonnull NSError *)errorWithErrorCode:(NSInteger)errorCode
                               userInfo:(NSDictionary * _Nonnull)userInfo;


@end

NS_ASSUME_NONNULL_END
