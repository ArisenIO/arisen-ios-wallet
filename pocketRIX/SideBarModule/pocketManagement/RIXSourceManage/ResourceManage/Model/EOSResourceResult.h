//
//  RIXResourceResult.h
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RIXResource.h"

@interface RIXResourceResult : NSObject
@property(nonatomic, strong) NSNumber *code;
@property(nonatomic, strong) NSString *message;
@property(nonatomic, strong) RIXResource *data;
@end
