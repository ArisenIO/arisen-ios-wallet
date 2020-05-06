//
//  WalletAccount.h
//  pocketRIX
//
//  Created by oraclechain on 2018/1/31.
//  Copyright © 2018年 oraclechain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalletAccount : NSObject
@property(nonatomic, strong) NSString *rixAccountName;

@property(nonatomic, strong) NSNumber *isMainAccount;


@property(nonatomic , assign) BOOL selected;
@end
