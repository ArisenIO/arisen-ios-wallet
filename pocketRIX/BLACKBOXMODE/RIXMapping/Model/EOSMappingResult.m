//
//  RIXMappingResult.m
//  pocketRIX
//
//  Created by oraclechain on 2018/6/13.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "RIXMappingResult.h"

@implementation RIXMappingResult
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"account_names" : @"data.account_names"};
}
@end
