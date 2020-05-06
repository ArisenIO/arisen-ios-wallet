//
//  GetCurrentRamPriceRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/10/29.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "GetCurrentRamPriceRequest.h"

@implementation GetCurrentRamPriceRequest


-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/RIXDataConditionSearchRam/GetRamTrades", REQUEST_HISTORY_HTTP];
}


@end
