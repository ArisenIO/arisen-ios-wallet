//
//  CpuNetManageViewController.m
//  pocketRIX
//
//  Created by oraclechain on 2018/10/24.
//  Copyright © 2018 oraclechain. All rights reserved.
//

#import "CpuNetManageViewController.h"
#import "CpuNetManageHeaderView.h"
#import "RIXResourceService.h"
#import "TransferService.h"
#import "UnstakeRIXAbiJsonTobinRequest.h"
#import "Approve_Abi_json_to_bin_request.h"

@interface CpuNetManageViewController ()<CpuNetManageHeaderViewDelegate, LoginPasswordViewDelegate, TransferServiceDelegate>
@property(nonatomic , strong) CpuNetManageHeaderView *headerView;
@property(nonatomic , strong) RIXResourceService *RIXResourceService;
@property(nonatomic, strong) LoginPasswordView *loginPasswordView;
@property(nonatomic , strong) TransferService *transferService;
@property(nonatomic , strong) UnstakeRIXAbiJsonTobinRequest *unstakeRIXAbiJsonTobinRequest;
@property(nonatomic , strong) Approve_Abi_json_to_bin_request *approve_Abi_json_to_bin_request;

@end

@implementation CpuNetManageViewController

- (CpuNetManageHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"CpuNetManageHeaderView" owner:nil options:nil] firstObject];
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 600);
        _headerView.delegate = self;
    }
    return _headerView;
}

-(AccountResult *)accountResult{
    if (!_accountResult) {
        _accountResult = [[AccountResult alloc] init];
    }
    return _accountResult;
}

- (RIXResourceService *)RIXResourceService{
    if (!_RIXResourceService) {
        _RIXResourceService = [[RIXResourceService alloc] init];
    }
    return _RIXResourceService;
}


- (LoginPasswordView *)loginPasswordView{
    if (!_loginPasswordView) {
        _loginPasswordView = [[[NSBundle mainBundle] loadNibNamed:@"LoginPasswordView" owner:nil options:nil] firstObject];
        _loginPasswordView.frame = self.view.bounds;
        _loginPasswordView.delegate = self;
    }
    return _loginPasswordView;
}

- (UnstakeRIXAbiJsonTobinRequest *)unstakeRIXAbiJsonTobinRequest{
    if (!_unstakeRIXAbiJsonTobinRequest) {
        _unstakeRIXAbiJsonTobinRequest = [[UnstakeRIXAbiJsonTobinRequest alloc] init];
    }
    return _unstakeRIXAbiJsonTobinRequest;
}

- (Approve_Abi_json_to_bin_request *)approve_Abi_json_to_bin_request{
    if (!_approve_Abi_json_to_bin_request) {
        _approve_Abi_json_to_bin_request = [[Approve_Abi_json_to_bin_request alloc] init];
    }
    return _approve_Abi_json_to_bin_request;
}

-(TransferService *)transferService{
    if (!_transferService) {
        _transferService = [[TransferService alloc] init];
        _transferService.delegate = self;
    }
    return _transferService;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden: YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden: YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- NAVIGATIONBAR_HEIGHT);
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 650);
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.headerView];
    
    [self.headerView updateViewWithRIXResourceResult:self.RIXResourceResult];
}

- (void)buildDataSource{
    WS(weakSelf);
    self.RIXResourceService.getAccountRequest.name = self.RIXResourceResult.data.account_name;
    [self.RIXResourceService get_account:^(RIXResourceResult *result, BOOL isSuccess) {
        if (isSuccess) {
            weakSelf.RIXResourceResult = result;
            [weakSelf.headerView updateViewWithRIXResourceResult:weakSelf.RIXResourceResult];
        }
        
    }];
    
    
}


- (void)cpuNetManageHeaderViewConfirmStakeBtnDidClick{
    
    if (IsStrEmpty(self.headerView.cpuAmountInputTF.text) && IsStrEmpty(self.headerView.netAmountInputTF.text)) {
        [TOASTVIEW showWithText: NSLocalizedString(@"输入不能为空!", nil)];
        return;
    }
    
    if (self.headerView.cpuAmountInputTF.text.doubleValue > self.RIXResourceResult.data.core_liquid_balance.doubleValue  || self.headerView.netAmountInputTF.text.doubleValue > self.RIXResourceResult.data.core_liquid_balance.doubleValue || (self.headerView.cpuAmountInputTF.text.doubleValue + self.headerView.netAmountInputTF.text.doubleValue)  > self.RIXResourceResult.data.core_liquid_balance.doubleValue) {
        [TOASTVIEW showWithText: NSLocalizedString(@"可用余额不足", nil)];
        return;
    }
    
    
    [self.view addSubview:self.loginPasswordView];
}


// loginPasswordViewDelegate
- (void)cancleBtnDidClick:(UIButton *)sender{
    [self removePasswordView];
}

- (void)confirmBtnDidClick:(UIButton *)sender{
    
    // 验证密码输入是否正确
    Wallet *current_wallet = CURRENT_WALLET;
    if (![WalletUtil validateWalletPasswordWithSha256:current_wallet.wallet_shapwd password:self.loginPasswordView.inputPasswordTF.text]) {
        [TOASTVIEW showWithText:NSLocalizedString(@"密码输入错误!", nil)];
        return;
    }
    
    if (self.headerView.cpuNetManageHeaderViewCurrentAction == CpuNetManageHeaderViewCurrentActionApprove) {
        // 质押
        [self approve];
    }else if (self.headerView.cpuNetManageHeaderViewCurrentAction == CpuNetManageHeaderViewCurrentActionUnstake) {
        // 赎回
        [self unStake];
    }
}

- (void)approve{
    self.approve_Abi_json_to_bin_request.action = ContractAction_DELEGATEBW;
    self.approve_Abi_json_to_bin_request.code = ContractName_ARISEN;
    self.approve_Abi_json_to_bin_request.from = self.RIXResourceResult.data.account_name;
    self.approve_Abi_json_to_bin_request.receiver = self.RIXResourceResult.data.account_name;
    self.approve_Abi_json_to_bin_request.transfer = @"0";
    
    self.approve_Abi_json_to_bin_request.stake_cpu_quantity = [NSString stringWithFormat:@"%.4f RIX", self.headerView.cpuAmountInputTF.text.doubleValue];
    self.approve_Abi_json_to_bin_request.stake_net_quantity = [NSString stringWithFormat:@"%.4f RIX", self.headerView.netAmountInputTF.text.doubleValue];

    WS(weakSelf);
    [self.approve_Abi_json_to_bin_request postOuterDataSuccess:^(id DAO, id data) {
#pragma mark -- [@"data"]
        NSLog(@"approve_abi_to_json_request_success: --binargs: %@",data[@"data"][@"binargs"] );
        AccountInfo *accountInfo = [[AccountsTableManager accountTable] selectAccountTableWithAccountName:weakSelf.RIXResourceResult.data.account_name];
        if (!accountInfo) {
            [TOASTVIEW showWithText: NSLocalizedString(@"本地无此账号!", nil) ];
            return ;
        }
        weakSelf.transferService.available_keys = @[VALIDATE_STRING(accountInfo.account_owner_public_key) , VALIDATE_STRING(accountInfo.account_active_public_key)];
        weakSelf.transferService.action = ContractAction_DELEGATEBW;
        weakSelf.transferService.sender = weakSelf.RIXResourceResult.data.account_name;
        weakSelf.transferService.code = ContractName_ARISEN;
#pragma mark -- [@"data"]
        weakSelf.transferService.binargs = data[@"data"][@"binargs"];
        weakSelf.transferService.pushTransactionType = PushTransactionTypeTransfer;
        weakSelf.transferService.password = weakSelf.loginPasswordView.inputPasswordTF.text;
        [weakSelf.transferService pushTransaction];
    } failure:^(id DAO, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)unStake{
    self.unstakeRIXAbiJsonTobinRequest.action = ContractAction_UNDELEGATEBW;
    self.unstakeRIXAbiJsonTobinRequest.code = ContractName_ARISEN;
    self.unstakeRIXAbiJsonTobinRequest.from = self.RIXResourceResult.data.account_name;
    self.unstakeRIXAbiJsonTobinRequest.receiver = self.RIXResourceResult.data.account_name;

    self.unstakeRIXAbiJsonTobinRequest.unstake_cpu_quantity = [NSString stringWithFormat:@"%.4f RIX", self.headerView.cpuAmountInputTF.text.doubleValue];
    self.unstakeRIXAbiJsonTobinRequest.unstake_net_quantity = [NSString stringWithFormat:@"%.4f RIX", self.headerView.netAmountInputTF.text.doubleValue];
    WS(weakSelf);
    [self.unstakeRIXAbiJsonTobinRequest postOuterDataSuccess:^(id DAO, id data) {
#pragma mark -- [@"data"]
        NSLog(@"approve_abi_to_json_request_success: --binargs: %@",data[@"data"][@"binargs"] );
        AccountInfo *accountInfo = [[AccountsTableManager accountTable] selectAccountTableWithAccountName:weakSelf.RIXResourceResult.data.account_name];
        if (!accountInfo) {
            [TOASTVIEW showWithText: NSLocalizedString(@"本地无此账号!", nil) ];
            return ;
        }
        weakSelf.transferService.available_keys = @[VALIDATE_STRING(accountInfo.account_owner_public_key) , VALIDATE_STRING(accountInfo.account_active_public_key)];
        weakSelf.transferService.action = ContractAction_UNDELEGATEBW;
        weakSelf.transferService.sender = weakSelf.RIXResourceResult.data.account_name;
        weakSelf.transferService.code = ContractName_ARISEN;
#pragma mark -- [@"data"]
        weakSelf.transferService.binargs = data[@"data"][@"binargs"];
        weakSelf.transferService.pushTransactionType = PushTransactionTypeTransfer;
        weakSelf.transferService.password = weakSelf.loginPasswordView.inputPasswordTF.text;
        [weakSelf.transferService pushTransaction];
    } failure:^(id DAO, NSError *error) {
        NSLog(@"%@", error);
    }];
}

// TransferServiceDelegate
extern NSString *TradeBandwidthDidSuccessNotification;
- (void)pushTransactionDidFinish:(RIXResourceResult *)result{
    if ([result.code isEqualToNumber:@0]) {
        if (self.headerView.cpuNetManageHeaderViewCurrentAction == CpuNetManageHeaderViewCurrentActionApprove) {
            // 质押
            [TOASTVIEW showWithText:NSLocalizedString(@"增加质押成功", nil) ];
         
        }else if (self.headerView.cpuNetManageHeaderViewCurrentAction == CpuNetManageHeaderViewCurrentActionUnstake) {
            // 赎回
            [TOASTVIEW showWithText:NSLocalizedString(@"赎回质押成功", nil)];
        }
        [self buildDataSource];
    }else{
        [TOASTVIEW showWithText: result.message];
    }
    [self removePasswordView];
    self.headerView.cpuAmountInputTF.text = nil;
    self.headerView.netAmountInputTF.text = nil;
}

- (void)removePasswordView{
    if (self.loginPasswordView) {
        [self.loginPasswordView removeFromSuperview];
        self.loginPasswordView = nil;
    }
}

@end
