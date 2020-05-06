//
//  GetRedPacketRecordRequest.h
//  pocketRIX
//
//  Created by oraclechain on 20/04/2018.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseNetworkRequest.h"


@interface GetRedPacketRecordRequest : BaseNetworkRequest
// 获取红包记录

/**
 账号
 */
@property(nonatomic, copy) NSString *account;

/**
 类型 RIX OCT
 */
@property(nonatomic, copy) NSString *type;

@end