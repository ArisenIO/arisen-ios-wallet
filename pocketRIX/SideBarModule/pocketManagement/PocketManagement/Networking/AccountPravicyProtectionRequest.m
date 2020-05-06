//
//  AccountPravicyProtectionRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/3/25.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "AccountPravicyProtectionRequest.h"

@implementation AccountPravicyProtectionRequest

-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/user/update_secret", REQUEST_PERSONAL_BASEURL];
}

-(NSDictionary *)parameters{
    NSDictionary *params = @{
                             @"RIXAccountName" : VALIDATE_STRING(self.RIXAccountName),
                             @"status" : VALIDATE_STRING(self.status)
                             
                             };
    return params;
}


@end
