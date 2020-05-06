//
//  BBCreateAccountHeaderView.m
//  pocketRIX
//
//  Created by oraclechain on 2018/5/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BBCreateAccountHeaderView.h"

@implementation BBCreateAccountHeaderView

- (IBAction)createAccount:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(createAccountUseRIXPrivateKey)]) {
        [self.delegate createAccountUseRIXPrivateKey];
    }
}

@end
