//
//  CreateRIXAccountRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "CreateRIXAccountRequest.h"

@implementation CreateRIXAccountRequest
-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/user/add_new_rix", REQUEST_PERSONAL_BASEURL];
}

-(id)parameters{
    
    return @{
             @"uid" : VALIDATE_STRING(self.uid),
             @"rixAccountName" : VALIDATE_STRING(self.rixAccountName),
             @"activeKey" : VALIDATE_STRING(self.activeKey),
             @"ownerKey" : VALIDATE_STRING(self.ownerKey)
             
             };
}
@end
