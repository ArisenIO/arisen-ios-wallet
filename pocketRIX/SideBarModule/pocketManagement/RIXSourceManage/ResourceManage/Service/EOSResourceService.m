//
//  RIXResourceService.m
//  pocketRIX
//
//  Created by oraclechain on 2018/6/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "RIXResourceService.h"


@implementation RIXResourceService

- (GetAccountRequest *)getAccountRequest{
    if (!_getAccountRequest) {
        _getAccountRequest = [[GetAccountRequest alloc] init];
    }
    return _getAccountRequest;
}
//
//- (RIXResourceResult *)RIXResourceResult{
//    if (!_RIXResourceResult) {
//        _RIXResourceResult = [[RIXResourceResult alloc] init];
//    }
//    return _RIXResourceResult;
//}


/**
 账号资产详情
 */
- (void)get_account:(CompleteBlock)complete{
    WS(weakSelf);
    
    [self.getAccountRequest postDataSuccess:^(id DAO, id data) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            
            weakSelf.RIXResourceResult = [RIXResourceResult mj_objectWithKeyValues:data];
            
            if (![weakSelf.RIXResourceResult.code isEqualToNumber:@0]) {
                [TOASTVIEW showWithText: VALIDATE_STRING(weakSelf.RIXResourceResult.message)];
                return ;
            }
            
            RIXResourceCellModel *cpu_model = [[RIXResourceCellModel alloc] init];
            cpu_model.title = NSLocalizedString(@"cpu", nil);
            cpu_model.used = weakSelf.RIXResourceResult.data.cpu_used;
            cpu_model.available = weakSelf.RIXResourceResult.data.cpu_available;
            cpu_model.max = weakSelf.RIXResourceResult.data.cpu_max;
            cpu_model.weight = weakSelf.RIXResourceResult.data.cpu_weight;
            
            RIXResourceCellModel *net_model = [[RIXResourceCellModel alloc] init];
            net_model.title = NSLocalizedString(@"net", nil);
            net_model.used = weakSelf.RIXResourceResult.data.net_used;
            net_model.available = weakSelf.RIXResourceResult.data.net_available;
            net_model.max = weakSelf.RIXResourceResult.data.net_max;
            net_model.weight = weakSelf.RIXResourceResult.data.net_weight;
            
            weakSelf.dataSourceArray = [NSMutableArray arrayWithObjects:cpu_model, net_model, nil];
            complete(weakSelf.RIXResourceResult, YES);
        }
    } failure:^(id DAO, NSError *error) {
        NSLog(@"%@", error);
        complete(nil, NO);
    }];
}


@end
