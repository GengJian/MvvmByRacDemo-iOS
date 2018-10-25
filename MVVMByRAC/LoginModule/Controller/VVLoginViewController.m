//
//  VVLoginViewController.m
//  MVVMByRAC
//
//  Created by Soul on 2018/10/22.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVLoginViewController.h"

#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>

@interface VVLoginViewController ()


@end

@implementation VVLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    #pragma mark - UI
    
    self.title = @"登陆";
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.statusLabel];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(self.view).offset(200);
        make.leftMargin.equalTo(self.view);
        make.width.width.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountTextField.mas_bottom).offset(20);
        make.left.equalTo(self.accountTextField);
        make.right.equalTo(self.accountTextField);
        make.height.equalTo(self.accountTextField);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(20);
        make.leftMargin.equalTo(self.view);
        make.width.width.equalTo(self.view);
    }];
    
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(50);
        make.centerX.equalTo(self.loginBtn);
    }];
    
    //==================== 监 听 ====================
  
    //输入框
    [[self.accountTextField rac_textSignal] subscribeNext:^(NSString *  _Nullable x) {
        NSLog(@"账号输入框内容:%@",x);
    }];
    RAC(self.vm,account) = self.accountTextField.rac_textSignal;
    
    [RACObserve(self.passwordTextField, text) subscribeNext:^(id  _Nullable x) {
        NSLog(@"密码框输入内容:%@",x);
    }];
    RAC(self.vm,password) = self.passwordTextField.rac_textSignal;
    
//    RAC(self.loginBtn, enabled) = self.vm.isLoginEnableSignal;
//    [self.vm.isLoginEnableSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"isLoginEnableSignal:%@",x);
//    }];
    RAC(self.loginBtn, enabled) = RACObserve(self.vm, isLoginEnable);
    
    //==================== 持 有 ====================
      @weakify(self)
    //按钮
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         NSLog(@"点击了登陆按钮:%@",[NSDate date]);
         @strongify(self)
         [self.vm.loginCommand execute:self.accountTextField.text];
     }];
    
    //==================== 绑 定 ====================
    //标签 KVO
    [self rac_observeKeyPath:@"vm.model.userName"
                     options:NSKeyValueObservingOptionNew
                    observer:self
                       block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
                           
                           NSLog(@"value:%@",value);
                           NSLog(@"change:%@",change);

                           self.statusLabel.text = self.vm.model.userName;
                       }
     ];
    
    RAC(self.statusLabel, text) = RACObserve(self.vm,model.userName);
    
#pragma mark - ViewModel
    RACSignal *signal1 = self.vm.loginCommand.executionSignals;
    [signal1 subscribeNext:^(id  _Nullable x) {
        NSLog(@"我听说登陆有结果了...\n%@",x);
    }];
    
    [RACObserve(self.vm,model.isLogin) subscribeError:^(NSError * _Nullable error) {
        NSLog(@"我听说出错了...\n:%@",error);
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITextField *)accountTextField{
    if (!_accountTextField) {
        _accountTextField = [UITextField new];
        [_accountTextField setBackgroundColor:[UIColor blueColor]];
    }
    return _accountTextField;
}

- (UITextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [UITextField new];
        [_passwordTextField setBackgroundColor:[UIColor purpleColor]];
    }
    return _passwordTextField;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setBackgroundColor:[UIColor greenColor]];
        [_loginBtn setTitle:@"登陆"
                   forState:UIControlStateNormal];
    }
    return _loginBtn;
}

- (UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.text = @"这是一个状态Label";
        _statusLabel.backgroundColor = [UIColor yellowColor];
    }
    return _statusLabel;
}

- (VVLoginViewModel *)vm{
    if (!_vm) {
        _vm = [VVLoginViewModel new];
    }
    return _vm;
}

@end
