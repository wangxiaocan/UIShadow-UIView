# UIShadow-UIView
给UIImageView添加直角、圆角阴影


### how to use

> #import "UIShadow+UIView.h"

```Object-C
_coverImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cover.jpg"]];
_coverImgView.bounds = CGRectMake(0, 0, 60, 80);
_coverImgView.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2);
_coverImgView.clipsToBounds = YES;
_coverImgView.layer.cornerRadius = 6.0;
[self.view addSubview:_coverImgView];
[_coverImgView showShadowLayer];
```
