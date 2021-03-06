//
//  UIView+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

#pragma mark - Frame
/// 视图原点
@property (nonatomic) CGPoint lj_viewOrigin;
/// 视图尺寸
@property (nonatomic) CGSize lj_viewSize;

#pragma mark - Frame Origin
/// frame 原点 x 值
@property (nonatomic) CGFloat lj_x;
/// frame 原点 y 值
@property (nonatomic) CGFloat lj_y;

#pragma mark - Frame Size
/// frame 尺寸 width
@property (nonatomic) CGFloat lj_width;
/// frame 尺寸 height
@property (nonatomic) CGFloat lj_height;

#pragma mark - 截屏
/// 当前视图内容生成的图像
@property (nonatomic, readonly, nullable)UIImage *hm_capturedImage;

@end
