//
//  RIXMappingImportAccountHeaderView.h
//  pocketRIX
//
//  Created by oraclechain on 2018/5/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "BaseView.h"

@protocol RIXMappingImportAccountHeaderViewDelegate<NSObject>
- (void)importRIXMappingAccountBtnDidClick;
@end


@interface RIXMappingImportAccountHeaderView : BaseView
@property(nonatomic, weak) id<RIXMappingImportAccountHeaderViewDelegate> delegate;


@property (weak, nonatomic) IBOutlet UITextField *privateKeyTF;

@end
