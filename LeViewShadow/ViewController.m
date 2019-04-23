//
//  ViewController.m
//  LeViewShadow
//
//  Created by Leon on 2019/4/23.
//  Copyright © 2019 leon. All rights reserved.
//

#import "ViewController.h"
#import "UIView+shadowPath.h"

@interface ViewController ()

@property (nonatomic ,strong) UIView *shaowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"顶部阴影",@"底部阴影",@"左侧阴影",@"右侧阴影",@"四周阴影",@"左右底部阴影", nil];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName, nil];
    CGFloat orginY = 0;
    for (int i = 0 ; i <titleArray.count; i++) {
        NSString *title = titleArray[i];
        CGRect rect = [title boundingRectWithSize:CGSizeMake(400, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        UIButton *shadowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shadowBtn.frame = CGRectMake(orginY,100,rect.size.width , 30);
        shadowBtn.tag = i+1;
        shadowBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [shadowBtn setTitle:title forState:UIControlStateNormal];
        [shadowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [shadowBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        shadowBtn.backgroundColor = [UIColor greenColor];
        orginY = shadowBtn.frame.origin.x+shadowBtn.frame.size.width+10;
        [self.view addSubview:shadowBtn];
    }
    
    [self shaowView];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 450, 50, 50)];
    imageView.layer.masksToBounds = NO;
    imageView.layer.shadowRadius = 3;
    imageView.layer.shadowColor = [UIColor redColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    imageView.layer.shadowOpacity = 0.9f;
    imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:imageView];
}
- (void)buttonClick:(UIButton *)shaowBtn{
    [_shaowView viewShadowPathWithColor:[UIColor redColor] shadowOpacity:0.5 shadowRadius:5 shadowPathType:shaowBtn.tag shadowPathWidth:10];
}
- (UIView *)shaowView{
    if (!_shaowView) {
        _shaowView = [[UIView alloc]init];
        _shaowView.frame = CGRectMake(0, 0, 100, 100);
        _shaowView.center = self.view.center;
        [_shaowView viewShadowPathWithColor:[UIColor redColor] shadowOpacity:0.5 shadowRadius:5 shadowPathType:LeShadowPathTop shadowPathWidth:10];
        _shaowView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_shaowView];
    }
    return _shaowView;
}
@end
