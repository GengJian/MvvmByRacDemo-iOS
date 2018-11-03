//
//  VVGoodsViewModel.h
//  MVVMByRAC
//
//  Created by Soul on 2018/10/27.
//  Copyright © 2018 Soul. All rights reserved.
//

#import "VVBaseViewModel.h"

#import "VVGoodsListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVGoodsViewModel : VVBaseViewModel

@property (strong, readonly, nonatomic) VVGoodsListModel *model;

@property (strong,nonatomic) RACCommand *refreshCommand;
@property (strong,nonatomic) RACCommand *loadMoreCommand;

@end

NS_ASSUME_NONNULL_END
