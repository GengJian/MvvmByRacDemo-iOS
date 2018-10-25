//
//  VVLoginViewController.h
//  MVVMByRAC
//
//  Created by Soul on 2018/10/22.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVBaseController.h"
#import "VVLoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVLoginViewController : VVBaseController

/*持有各种View控件,并实现布局*/
//input控件,记得双向绑定到vm中;一方面将user的数据交给vm用于逻辑计算;另一方面监听vm的属性影响到控件展示
@property (strong, nonatomic) UITextField *accountTextField;
@property (strong, nonatomic) UITextField *passwordTextField;

@property (strong, nonatomic) UIButton *loginBtn;
@property (strong, nonatomic) UILabel *statusLabel;

/*持有一个vm,用于调用vm中的命令方法,以及KVC这个vm影响到界面布局的属性*/
//这里涉及到登陆逻辑就有一个loginVm
@property (strong, nonatomic) VVLoginViewModel *vm;

@end

NS_ASSUME_NONNULL_END
