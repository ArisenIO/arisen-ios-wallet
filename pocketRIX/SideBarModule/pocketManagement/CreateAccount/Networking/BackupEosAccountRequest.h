//
//  BackupRIXAccountRequest.h
//  pocketRIX
//
//  Created by oraclechain on 2018/1/23.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "BaseNetworkRequest.h"


/**
 给用户添加新的RIX账号
 */
@interface BackupRIXAccountRequest : BaseNetworkRequest

/**
 用户uid
 */
@property(nonatomic, copy) NSString *uid;

/**
 RIX账号名
 */
@property(nonatomic, copy) NSString *RIXAccountName;


@end
