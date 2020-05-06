//
//  UnStakeRIXHeaderView.h
//  pocketRIX
//
//  Created by oraclechain on 2018/6/15.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountResult.h"
#import "Account.h"

@protocol UnStakeRIXHeaderViewDelegate<NSObject>
- (void)confirmUnStakeBtnDidClick;
@end


@interface UnStakeRIXHeaderView : BaseView

@property(nonatomic , strong) AccountResult *model;

@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@property(nonatomic, weak) id<UnStakeRIXHeaderViewDelegate> delegate;
@end
