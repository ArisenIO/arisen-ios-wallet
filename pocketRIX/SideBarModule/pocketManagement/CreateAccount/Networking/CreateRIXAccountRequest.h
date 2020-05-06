//
//  CreateRIXAccountRequest.h
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseNetworkRequest.h"

@interface CreaterixAccountRequest : BaseNetworkRequest
/**
 用户uid
 */
@property(nonatomic, copy) NSString *uid;

/**
 rix账号名
 */
@property(nonatomic, copy) NSString *rixAccountName;

/**
 activeKey
 */
@property(nonatomic, copy) NSString *activeKey;

/**
 onwerKey
 */
@property(nonatomic, copy) NSString *ownerKey;


@end
