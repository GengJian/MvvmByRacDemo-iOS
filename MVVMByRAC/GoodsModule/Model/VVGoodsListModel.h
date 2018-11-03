//
//  VVGoodsListModel.h
//  MVVMByRAC
//
//  Created by Soul on 2018/10/27.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVGoodsListModel : VVBaseModel

@property(strong, nonatomic) NSArray <VVGoodDataModel *>*listModel;

@end

@interface VVGoodDataModel : NSObject

@property(copy, nonatomic) NSString *goodName;

@end

NS_ASSUME_NONNULL_END
