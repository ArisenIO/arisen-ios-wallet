//
//  CreateAccountService.h
//  pocketRIX
//
//  Created by oraclechain on 2018/1/19.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "BaseService.h"
#import "CreateAccountRequest.h"
#import "BackupRIXAccountRequest.h"
#import "CreateRIXAccountRequest.h"

@interface CreateAccountService : BaseService
@property(nonatomic, strong) CreateAccountRequest *createAccountRequest;
@property(nonatomic, strong) BackupRIXAccountRequest *backupRIXAccountRequest;
@property(nonatomic , strong) CreateRIXAccountRequest *createRIXAccountRequest;

- (void)createAccount:(CompleteBlock)complete;


/**
 备份账号到服务器
 */
- (void)backupAccount:(CompleteBlock)complete;

- (void)createRIXAccount:(CompleteBlock)complete;


@end
