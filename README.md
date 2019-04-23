# LeViewShadow
一般情况下设置阴影只需要设置layer就行，但是如果只是单边阴影，只设置layer效果不是多好，可以用贝塞尔曲线实现。

##### 1. 直接设置layer阴影效果

```
UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 400, 50, 50)];
imageView.layer.shadowColor = [UIColor redColor].CGColor;
//剪切边界 如果视图上的子视图layer超出视图layer部分就截取掉 如果添加阴影这个属性必须是NO 不然会把阴影切掉
imageView.layer.masksToBounds = NO;
//阴影半径，默认3
imageView.layer.shadowRadius = 3;
//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
imageView.layer.shadowOffset = CGSizeMake(0.0f,0.0f);
// 阴影透明度，默认0
imageView.layer.shadowOpacity = 0.9f;
imageView.backgroundColor = [UIColor greenColor];
[self.view addSubview:imageView];
```

![阴影效果](https://ws4.sinaimg.cn/large/006tNc79ly1g2cj9bbgfpj303y02j3yd.jpg)

##### 2. 利用贝塞尔曲线实现
主要代码

```
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(LeShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth{
    
    self.layer.masksToBounds = NO;//必须要等于NO否则会把阴影切割隐藏掉
    self.layer.shadowColor = shadowColor.CGColor;// 阴影颜色
    self.layer.shadowOpacity = shadowOpacity;// 阴影透明度，默认0
    self.layer.shadowOffset = CGSizeZero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
    CGRect shadowRect = CGRectZero;
    CGFloat originX,originY,sizeWith,sizeHeight;
    originX = 0;
    originY = 0;
    sizeWith = self.bounds.size.width;
    sizeHeight = self.bounds.size.height;
    
    if (shadowPathType == LeShadowPathTop) {
        shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == LeShadowPathBottom){
        shadowRect = CGRectMake(originY, sizeHeight-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == LeShadowPathLeft){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == LeShadowPathRight){
        shadowRect = CGRectMake(sizeWith-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == LeShadowPathCommon){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, 2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth/2);
    }else if (shadowPathType == LeShadowPathAround){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth);
    }
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = bezierPath.CGPath;//阴影路径
}
```

![阴影效果.gif](https://upload-images.jianshu.io/upload_images/1483397-df8940a8712bf924.gif?imageMogr2/auto-orient/strip)
