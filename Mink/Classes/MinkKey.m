//
//  MinkKey.m
//  Pods
//
//  Created by Julius Lundang on 14/03/2019.
//

#import "MinkKey.h"

@implementation MinkKey

- (instancetype)initWithPublicKey:(NSString *)publicKey
                       privateKey:(NSString *)privateKey {
  self = [super init];
  if (self) {
    _publicKey = publicKey;
    _privateKey = privateKey;
  }
  
  return self;
}

@end
