//
//  Get_account_assetsResult.h
//  pocketRIX
//
//  Created by oraclechain on 2018/10/20.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface Get_account_assetsResult : BaseResult

@property(nonatomic , strong) NSArray *user_asset_list;

@end

NS_ASSUME_NONNULL_END
