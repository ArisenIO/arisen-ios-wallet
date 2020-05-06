//
//  RIXResourceService.h
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseService.h"
#import "GetAccountRequest.h"
#import "RIXResourceResult.h"
#import "RIXResource.h"
#import "RIXResourceCellModel.h"


@interface RIXResourceService : BaseService
@property(nonatomic, strong) GetAccountRequest *getAccountRequest;

@property(nonatomic , strong) RIXResourceResult *RIXResourceResult;
/**
 账号资产详情
 */
- (void)get_account:(CompleteBlock)complete;



@end
