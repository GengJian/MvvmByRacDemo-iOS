//
//  VVLoginViewModel.h
//  MVVMByRAC
//
//  Created by Soul on 2018/10/22.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVBaseViewModel.h"

#import "VVLoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVLoginViewModel : VVBaseViewModel

/*持有一个服务器响应Model,View可以KVC此model某些属性变化直接反应view变化*/
//e.g. 假装服务器返回之后给的用户信息model,因为View不能直接持有model,而是被动KVOs此model,所以只读
@property (strong ,readonly ,nonatomic) VVLoginModel *model;

/*暴露需要的数据源datasource属性作为判断逻辑中的入参*/
//e.g. 因为vm要处理登陆逻辑,需要传入账号密码;要在vc里双向绑定这两个值随着控件TextField变化而变化
@property (copy, nonatomic, readonly) NSString *account;
@property (copy, nonatomic, readonly) NSString *password;

/*暴露会影响到界面变化的delegate属性作为可以绑定的信号*/
//e.g. 因为view有个loginBtn按钮,可以绑定本属性决定loginBtn.enable;这个isLoginEnable判断逻辑由vm处理,button只关心随变而变
@property (assign, nonatomic, readonly) BOOL isLoginEnable;
//如果是上述属性表达方式,View需要RACOberserve(self.vm.isisLoginEnable);
//所以可以直接包装成RAC信号,直接[self.vm.isLoginEnableSignal subsuribeNext:]
//⚠️感觉这里也该只读,对RAC不熟,此处存疑??
@property (strong, nonatomic) RACSignal *isLoginEnableSignal;

/*暴露可以接受Action绑定的命令*/
//登录按钮点击执行的命令
@property (strong,nonatomic) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
