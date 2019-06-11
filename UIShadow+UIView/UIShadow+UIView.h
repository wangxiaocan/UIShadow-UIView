//
//  UIShadow+UIView.h
//  PageTest
//
//  Created by 王文科 on 2019/6/11.
//  Copyright © 2019 xiaocan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface  UIView(UIShadow_UIImageView)

@property (nonatomic, strong) CALayer   *shadow_layer;

- (void)showShadowLayer;

- (void)removeShadowLayer;

- (void)shadow_setBounds:(CGRect)bounds;

@end

NS_ASSUME_NONNULL_END
