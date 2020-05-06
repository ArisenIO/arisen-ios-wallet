//
//  RIXMappingImportAccountHeaderView.m
//  pocketRIX
//
//  Created by oraclechain on 2018/5/21.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "RIXMappingImportAccountHeaderView.h"

@interface RIXMappingImportAccountHeaderView()
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet BaseTextView *tipTextView;
@end


@implementation RIXMappingImportAccountHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.tipTextView.placeholder = NSLocalizedString(@"该功能仅适用于RIX映射获得的私钥，且每个映射获得的私钥只能创建一个的RIX账号。", nil);
}

- (IBAction)importAccount:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(importRIXMappingAccountBtnDidClick)]) {
        [self.delegate importRIXMappingAccountBtnDidClick];
    }
}

@end
