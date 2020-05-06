//
//  Get_pocketrix_info_request.m
//  pocketrix
//
//  Created by oraclechain on 2018/10/31.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "Get_pocketrix_info_request.h"

@implementation Get_pocketrix_info_request

-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/get_pocketrix_info", REQUEST_PERSONAL_BASEURL];
}

@end
