//
//  UIView+shadowPath.h
//  LeViewShadow
//
//  Created by Leon on 2019/4/23.
//  Copyright © 2019 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , LeShadowPathType) {
    LeShadowPathTop    = 1,
    LeShadowPathBottom = 2,
    LeShadowPathLeft   = 3,
    LeShadowPathRight  = 4,
    LeShadowPathCommon = 5,
    LeShadowPathAround = 6,
    
};

@interface UIView (shadowPath)

/**
 给UIView添加阴影

 @param shadowColor 阴影颜色
 @param shadowOpacity 阴影透明度 默认0
 @param shadowRadius 阴影半径 也就是阴影放射程度 默认3
 @param shadowPathType 阴影方向
 @param shadowPathWidth 阴影放射g宽度
 */
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(LeShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;



@end

NS_ASSUME_NONNULL_END
