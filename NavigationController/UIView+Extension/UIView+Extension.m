//
//  UIView+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (HMObjcSugar)

#pragma mark - Frame
- (CGPoint)lj_viewOrigin {
    return self.frame.origin;
}

- (void)setlj_viewOrigin:(CGPoint)lj_viewOrigin {
    CGRect newFrame = self.frame;
    newFrame.origin = lj_viewOrigin;
    self.frame = newFrame;
}

- (CGSize)lj_viewSize {
    return self.frame.size;
}

- (void)setlj_viewSize:(CGSize)lj_viewSize {
    CGRect newFrame = self.frame;
    newFrame.size = lj_viewSize;
    self.frame = newFrame;
}

#pragma mark - Frame Origin
- (CGFloat)lj_x {
    return self.frame.origin.x;
}

- (void)setlj_x:(CGFloat)lj_x {
    CGRect newFrame = self.frame;
    newFrame.origin.x = lj_x;
    self.frame = newFrame;
}

- (CGFloat)lj_y {
    return self.frame.origin.y;
}

- (void)setLj_y:(CGFloat)lj_y {
    CGRect newFrame = self.frame;
    newFrame.origin.y = lj_y;
    self.frame = newFrame;
}

#pragma mark - Frame Size
- (CGFloat)lj_width {
    return self.frame.size.width;
}

- (void)setLj_width:(CGFloat)lj_width {
    CGRect newFrame = self.frame;
    newFrame.size.width = lj_width;
    self.frame = newFrame;
}

- (CGFloat)lj_height {
    return self.frame.size.height;
}

- (void)setLj_height:(CGFloat)lj_height {
    CGRect newFrame = self.frame;
    newFrame.size.height = lj_height;
    self.frame = newFrame;
}

#pragma mark - 截屏
- (UIImage *)lj_capturedImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    UIImage *result = nil;
    if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
