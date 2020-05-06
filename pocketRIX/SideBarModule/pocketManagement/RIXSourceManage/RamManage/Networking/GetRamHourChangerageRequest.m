//
//  GetRamHourChangerageRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/10/29.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "GetRamHourChangerageRequest.h"

@implementation GetRamHourChangerageRequest
-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/rixDataConditionSearchRam/GetHourChangerage", REQUEST_HISTORY_HTTP];
}

@end
