//
//  ModifyApproveViewController.h
//  pocketRIX
//
//  Created by oraclechain on 2018/6/22.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseViewController.h"
#import "RIXResourceResult.h"
#import "RIXResource.h"
#import "AccountResult.h"

@interface ModifyApproveViewController : BaseViewController
@property(nonatomic , copy) NSString *pageType;
@property(nonatomic , strong) RIXResourceResult *RIXResourceResult;
@property(nonatomic , strong) AccountResult *accountResult;
@end
