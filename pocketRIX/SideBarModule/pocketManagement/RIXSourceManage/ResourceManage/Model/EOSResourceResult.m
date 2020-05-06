//
//  RIXResourceResult.m
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "RIXResourceResult.h"

@implementation RIXResourceResult

- (RIXResource *)data{
    if (!_data) {
        _data = [[RIXResource alloc] init];
    }
    return _data;
}

@end
