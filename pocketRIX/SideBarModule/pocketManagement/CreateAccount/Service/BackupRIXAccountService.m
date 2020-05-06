
//
//  BackupRIXAccountService.m
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BackupRIXAccountService.h"
#import "BackupRIXAccountRequest.h"

@implementation BackupRIXAccountService

- (BackupRIXAccountRequest *)backupRIXAccountRequest{
    if (!_backupRIXAccountRequest) {
        _backupRIXAccountRequest = [[BackupRIXAccountRequest alloc] init];
    }
    return _backupRIXAccountRequest;
}
- (void)backupAccount:(CompleteBlock)complete{
    
    [self.backupRIXAccountRequest postDataSuccess:^(id DAO, id data) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            complete(data , YES);
        }
    } failure:^(id DAO, NSError *error) {
        complete(nil, NO);
    }];
    
}

@end
