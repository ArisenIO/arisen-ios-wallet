//
//  VipRegistAccountService.h
//  pocketRIX
//
//  Created by oraclechain on 2018/7/31.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseService.h"
#import "InviteCodeRegisterRequest.h"

@interface VipRegistAccountService : BaseService

@property(nonatomic , strong) InviteCodeRegisterRequest *inviteCodeRegisterRequest;

- (void)createRIXAccount:(CompleteBlock)complete;


@end
