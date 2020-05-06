//
//  BackupRIXAccountService.h
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseService.h"
#import "BackupRIXAccountRequest.h"

@interface BackupRIXAccountService : BaseService
@property(nonatomic, strong) BackupRIXAccountRequest *backupRIXAccountRequest;

/**
 备份账号到服务器
 */
- (void)backupAccount:(CompleteBlock)complete;

@end
