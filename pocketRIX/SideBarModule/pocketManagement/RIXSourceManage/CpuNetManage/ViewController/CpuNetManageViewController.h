//
//  CpuNetManageViewController.h
//  pocketRIX
//
//  Created by oraclechain on 2018/10/24.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseViewController.h"
#import "RIXResourceResult.h"
#import "RIXResource.h"
#import "RIXResourceCellModel.h"
#import "AccountResult.h"
#import "Account.h"


NS_ASSUME_NONNULL_BEGIN

@interface CpuNetManageViewController : BaseViewController
@property (nonatomic , retain) UINavigationController *navigationController;
@property(nonatomic , strong) AccountResult *accountResult;

@property(nonatomic , strong) RIXResourceResult *RIXResourceResult;
@end

NS_ASSUME_NONNULL_END
