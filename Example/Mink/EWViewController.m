//
//  EWViewController.m
//  Mink
//
//  Created by Julius Lundang on 03/14/2019.
//  Copyright (c) 2019 Julius Lundang. All rights reserved.
//

@import Mink;

#import "EWViewController.h"

@interface EWViewController ()

@end

@implementation EWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  NSString *publicKey = @""; // TODO: Add your public key here
  NSString *privateKey = @""; // TODO: Add your private key here
  MinkKey *key = [[MinkKey alloc] initWithPublicKey:publicKey privateKey:privateKey];
  NSError *error;
  MinkCrypto *crypto = [[MinkCrypto alloc] initWithKey:key error:&error];
  NSString *encryptedText = [crypto encryptText:@"我的家人住在加拿大" error:&error];
  NSLog(@"%@", encryptedText);
  
  NSString *decryptedText = [crypto decryptText:@"" // TODO: Add your encryptedText here
                                          error:&error];
  NSLog(@"%@", decryptedText);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
