//
//  GetQuestionListRequest.m
//  pocketRIX
//
//  Created by oraclechain on 2018/2/3.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import "GetQuestionListRequest.h"

@implementation GetQuestionListRequest

-(NSString *)requestUrlPath{
    return [NSString stringWithFormat:@"%@/rixaskanswer30/GetAsksJson", REQUEST_CONTRACT_BASEURL];

}

-(id)parameters{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:VALIDATE_NUMBER(self.askid) forKey:@"askid"];
    [params setObject:VALIDATE_NUMBER(self.releasedLable) forKey:@"releasedLable"];

    NSMutableDictionary *pageDic = [NSMutableDictionary dictionary];
    [pageDic setObject:VALIDATE_NUMBER(self.pageNum) forKey:@"pageNum"];
    [pageDic setObject:VALIDATE_NUMBER(self.pageSize) forKey:@"pageSize"];
    [params setObject:pageDic forKey:@"page"];
    return params;
}

@end
