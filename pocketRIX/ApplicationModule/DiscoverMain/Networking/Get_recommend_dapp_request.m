//
//  Get_recommend_dapp_request.m
//  pocketRIX
//
//  Created by oraclechain on 2018/11/1.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "Get_recommend_dapp_request.h"

@implementation Get_recommend_dapp_request

-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/recommend_dapp", REQUEST_PERSONAL_BASEURL];
}


@end
