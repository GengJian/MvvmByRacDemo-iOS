//
//  VVLoginViewModel.m
//  MVVMByRAC
//
//  Created by Soul on 2018/10/22.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVLoginViewModel.h"

#import <ReactiveObjC/NSObject+RACKVOWrapper.h>

@implementation VVLoginViewModel

- (instancetype)init{
    if (self = [super init]) {
        //每个vm都有至少一个对应的model,可以初始化掉
        _model = [VVLoginModel new];
        
        //因为view要从vm中获取状态,所以在网络请求前的初始化数据也可以初始化在vm中,
        _model.isLogin = NO;
        
        //监听
        RAC(self,isLoginEnable) = [[RACSignal combineLatest:@[
                                                              RACObserve(self, account),
                                                              RACObserve(self, password)]
                                    ]
                                   map:^id _Nullable(RACTuple * _Nullable value) {
                                       RACTupleUnpack(NSString *account, NSString *pwd) = value;
                                       NSLog(@"RACTupleUnpack:%@,%@",account,pwd);
                                       return @(account && pwd && account.length && pwd.length);
                                   }];
    }
    return self;
}

- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString*  _Nullable input) {

            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                //发起网络请求
                NSInteger rand = input.integerValue;
                NSInteger res = rand%2;
                NSLog(@"随机数%ld,Bool:%ld",(long)rand,(long)res);
                    if (res == 0) {
                        //登陆成功
                        self.model.isLogin = YES;
                        self.model.userName = @"Alakebahuba";
                        
                        [subscriber sendNext:@"登陆成功"];
                        [subscriber sendCompleted];
                    }else{
                        //登陆失败
                        self.model.isLogin = NO;
                        self.model.userName = @"神秘人";
                        [subscriber sendNext:@"登陆失败"];
                        [subscriber sendCompleted];
                        [subscriber sendError:[NSError errorWithDomain:@"NNNNN"
                                                                  code:404
                                                              userInfo:@{
                                                                         @"key":@"329"
                                                                         }]];
                    }

                return nil;
            }];  
        }];
    }
    return _loginCommand;
}

@end
