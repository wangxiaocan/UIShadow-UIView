# UIShadow-UIView
给UIImageView添加直角、圆角阴影


### how to use

> #import "UIShadow+UIView.h"

```Object-C
_coverImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cover.jpg"]];
_coverImgView.bounds = CGRectMake(0, 0, 240, 320);
_coverImgView.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2);
_coverImgView.shadow_opacity = 1.0;
_coverImgView.shadow_color = [UIColor redColor];
_coverImgView.shadow_offset = CGSizeZero;
_coverImgView.shadow_radius = 3.0;
_coverImgView.shadow_corner_radius = 6.0;
_coverImgView.showShadowLayer = YES;
[self.view addSubview:_coverImgView];
    
//    or use below function
//    [_coverImgView showDefaultShadow];
```
![img](https://github.com/wangxiaocan/UIShadow-UIView/blob/master/IMG_3253.png)
