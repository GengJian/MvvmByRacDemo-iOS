//
//  VVBaseModel.h
//  MVVMByRAC
//
//  Created by Soul on 2018/10/24.
//  Copyright © 2018 Soul. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseModel : NSObject

@property (assign, nonatomic) BOOL responseStatus;
@property (copy, nonatomic) NSString *message;

@end

NS_ASSUME_NONNULL_END
