//
//  BandwidthManageViewController.h
//  pocketRIX
//
//  Created by 师巍巍 on 21/06/2018.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseViewController.h"
#import "RIXResourceResult.h"
#import "RIXResource.h"
#import "RIXResourceCellModel.h"
#import "AccountResult.h"
#import "Account.h"



@interface BandwidthManageViewController : BaseViewController

@property (nonatomic , retain) UINavigationController *navigationController;
@property(nonatomic , strong) AccountResult *accountResult;

@end
