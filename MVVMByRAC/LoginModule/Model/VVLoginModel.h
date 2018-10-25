//
//  VVLoginModel.h
//  MVVMByRAC
//
//  Created by Soul on 2018/10/22.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVLoginModel : VVBaseModel

//继承于BaseModel,遵循服务器返回的数据结构

//暴露属性,为正常请求之后返回的数据模型

@property (assign, nonatomic) BOOL isLogin;

@property (copy, nonatomic) NSString *userName;

@end

NS_ASSUME_NONNULL_END
