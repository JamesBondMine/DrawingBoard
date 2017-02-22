//
//  ScreenShotView.h
//  DrawingBoard
//
//  Created by hipiao on 16/8/25.
//  Copyright © 2016年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenShotView : UIView

- (UIImage *)screenshot;

- (UIImage *)screenshotWithRect:(CGRect)rect;

@end
