//
//  RedPacketRecord.m
//  pocketRIX
//
//  Created by oraclechain on 20/04/2018.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "RedPacketRecord.h"

@implementation RedPacketRecord
+(NSDictionary *)mj_replacedKeyFromPropertyName{
     return @{@"redPacket_id" : @"id" };
}
@end