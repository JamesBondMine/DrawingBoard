//
//  Squiggle.h
//  Painter
//
//  Created by  ibokan on 10-9-7.
//  Copyright 2010 tencent.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Squiggle : NSObject 
{
    NSMutableArray *pointsArray;
	UIColor *strokeColor;
	float lineWidth;
}
@property (nonatomic, retain) NSMutableArray *pointsArray;
@property (retain) UIColor *strokeColor;
@property float lineWidth;

-(void)addPoint:(CGPoint)point;

@end
