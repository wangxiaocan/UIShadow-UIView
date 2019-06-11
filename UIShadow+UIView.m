//
//  UIShadow+UIView.m
//  PageTest
//
//  Created by 王文科 on 2019/6/11.
//  Copyright © 2019 xiaocan. All rights reserved.
//

#import "UIShadow+UIView.h"
#import <objc/runtime.h>


static NSString *const SHADOW_LAYER = @"shadow_layer";
@implementation UIView(UIShadow_UIImageView)

static inline void shadow_image_exchangeMethod(Method m1,Method m2){
    method_exchangeImplementations(m1, m2);
}

static inline BOOL shadow_addInstanceMethod(Class cls,SEL select){
    return class_addMethod(cls, select, class_getMethodImplementation(cls, select), method_getTypeEncoding(class_getInstanceMethod(cls, select)));
}

static inline BOOL shadow_addClassMethod(Class cls,SEL select){
    return class_addMethod(cls, select, class_getMethodImplementation(cls, select), method_getTypeEncoding(class_getClassMethod(cls, select)));
}


+ (void)load{
    Class class = [self class];
    shadow_image_exchangeMethod(class_getInstanceMethod(class, @selector(setBounds:)), class_getInstanceMethod(class, @selector(shadow_setBounds:)));
    shadow_image_exchangeMethod(class_getInstanceMethod(class, @selector(setFrame:)), class_getInstanceMethod(class, @selector(shadow_setFrame:)));
    shadow_image_exchangeMethod(class_getInstanceMethod(class, @selector(setCenter:)), class_getInstanceMethod(class, @selector(shadow_setCenter:)));
    shadow_image_exchangeMethod(class_getInstanceMethod(class, @selector(didMoveToSuperview)), class_getInstanceMethod(class, @selector(shadow_didMoveToSuperview)));
    shadow_image_exchangeMethod(class_getInstanceMethod(class, @selector(removeFromSuperview)), class_getInstanceMethod(class, @selector(shadow_removeFromSuperview)));
    shadow_image_exchangeMethod(class_getInstanceMethod(class, NSSelectorFromString(@"dealloc")), class_getInstanceMethod(class, @selector(shadow_dealloc)));
    
    shadow_addInstanceMethod(class, @selector(showShadowLayer));
    shadow_addInstanceMethod(class, @selector(removeShadowLayer));
}

- (void)setShadow_layer:(CALayer *)shadow_layer{
    objc_setAssociatedObject(self, &SHADOW_LAYER, shadow_layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CALayer *)shadow_layer{
    return objc_getAssociatedObject(self, &SHADOW_LAYER);
}



- (void)shadow_setBounds:(CGRect)bounds{
    [self shadow_setBounds:bounds];
    [self shadow_layer_valchanged];
}

- (void)shadow_setFrame:(CGRect)frame{
    [self shadow_setFrame:frame];
    [self shadow_layer_valchanged];
}

- (void)shadow_setCenter:(CGPoint)center{
    [self shadow_setCenter:center];
    [self shadow_layer_valchanged];
}

- (void)shadow_didMoveToSuperview{
    [self shadow_didMoveToSuperview];
    if (self.superview && self.shadow_layer) {
        [self.superview.layer insertSublayer:self.shadow_layer below:self.layer];
        [self shadow_layer_valchanged];
    }
}

- (void)shadow_dealloc{
    if (self.shadow_layer) {
        [self.shadow_layer removeFromSuperlayer];
    }
    [self shadow_dealloc];
}

- (void)shadow_removeFromSuperview{
    [self shadow_removeFromSuperview];
    if (self.shadow_layer) {
        [self.shadow_layer removeFromSuperlayer];
    }
}


- (void)showShadowLayer{
    if (!self.shadow_layer) {
        self.shadow_layer = [CALayer layer];
        self.shadow_layer.backgroundColor = [UIColor whiteColor].CGColor;
        self.shadow_layer.cornerRadius = self.layer.cornerRadius;
        self.shadow_layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.shadow_layer.shadowOffset = CGSizeZero;
        self.shadow_layer.shadowOpacity = 1.0;
        self.shadow_layer.shadowRadius = 2.0;
    }
    self.shadow_layer.frame = self.frame;
    if (self.superview) {
        [self.superview.layer insertSublayer:self.shadow_layer below:self.layer];
    }
}

- (void)removeShadowLayer{
    if (self.shadow_layer) {
        [self.shadow_layer removeFromSuperlayer];
        self.shadow_layer = nil;
    }
}

- (void)shadow_layer_valchanged{
    if (self.shadow_layer) {
        self.shadow_layer.frame = self.frame;
        self.shadow_layer.cornerRadius = self.layer.cornerRadius;
    }
}


@end
