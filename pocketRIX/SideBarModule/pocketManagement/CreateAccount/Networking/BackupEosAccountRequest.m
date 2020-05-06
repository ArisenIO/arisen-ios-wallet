//
//  BackupRIXAccountRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/1/23.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "BackupRIXAccountRequest.h"

@implementation BackupRIXAccountRequest
-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/user/add_new_RIX", REQUEST_PERSONAL_BASEURL];
}

-(id)parameters{
    return @{
             @"uid" : VALIDATE_STRING(self.uid),
             @"RIXAccountName" : VALIDATE_STRING(self.RIXAccountName)
             
             };
}
@end
