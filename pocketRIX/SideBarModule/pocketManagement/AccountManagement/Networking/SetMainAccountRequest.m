//
//  SetMainAccountRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/1/31.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "SetMainAccountRequest.h"

@implementation SetMainAccountRequest
-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/user/toggleRixMain", REQUEST_PERSONAL_BASEURL];;
}
-(id)parameters{
    return @{@"uid" : VALIDATE_STRING(self.uid),
             @"rixAccountName" : VALIDATE_STRING(self.rixAccountName)};
}
@end
