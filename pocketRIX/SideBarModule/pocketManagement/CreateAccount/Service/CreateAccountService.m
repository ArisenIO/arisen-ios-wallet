//
//  CreateAccountService.m
//  pocketRIX
//
//  Created by oraclechain on 2018/1/19.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "CreateAccountService.h"


@implementation CreateAccountService

- (CreateAccountRequest *)createAccountRequest{
    if (!_createAccountRequest) {
        _createAccountRequest = [[CreateAccountRequest alloc] init];
    }
    return _createAccountRequest;
}

- (BackupRIXAccountRequest *)backupRIXAccountRequest{
    if (!_backupRIXAccountRequest) {
        _backupRIXAccountRequest = [[BackupRIXAccountRequest alloc] init];
    }
    return _backupRIXAccountRequest;
}

- (CreateRIXAccountRequest *)createRIXAccountRequest{
    if (!_createRIXAccountRequest) {
        _createRIXAccountRequest = [[CreateRIXAccountRequest alloc] init];
    }
    return _createRIXAccountRequest;
}
- (void)createAccount:(CompleteBlock)complete{
    [self.createAccountRequest setShowActivityIndicator:YES];
    [self.createAccountRequest postDataSuccess:^(id DAO, id data) {
        complete(data , YES);
    } failure:^(id DAO, NSError *error) {
        NSLog(@"responseERROR:%@", [NSJSONSerialization JSONObjectWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:NSJSONReadingMutableContainers error:nil]);
    }];
}


/**
 备份账号到服务器
 */
- (void)backupAccount:(CompleteBlock)complete{
    
    [self.backupRIXAccountRequest postDataSuccess:^(id DAO, id data) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            complete(data , YES);
        }
    } failure:^(id DAO, NSError *error) {
        complete(nil, NO);
    }];
    
}

- (void)createRIXAccount:(CompleteBlock)complete{
    [self.createRIXAccountRequest postDataSuccess:^(id DAO, id data) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            complete(data , YES);
        }
    } failure:^(id DAO, NSError *error) {
        complete(nil, NO);
    }];
}

@end
