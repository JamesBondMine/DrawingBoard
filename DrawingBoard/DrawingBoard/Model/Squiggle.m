//
//  Squiggle.m
//  Painter
//
//  Created by  ibokan on 10-9-7.
//  Copyright 2010 tencent.com. All rights reserved.
//

#import "Squiggle.h"


@implementation Squiggle
@synthesize pointsArray;
@synthesize strokeColor;
@synthesize lineWidth;

-(id) init
{
	if(self = [super init])
	{
		pointsArray = [[NSMutableArray alloc] init];
		strokeColor = [UIColor blackColor];
        lineWidth = 10.0;
	}
	
	return self;
}


-(void) addPoint:(CGPoint)point 
{
	//这里得用NSValue将结构体类型的CGPoint转换为对象
	NSValue *value = [NSValue valueWithBytes:&point objCType:@encode(CGPoint)];
	[pointsArray addObject:value];
	
}
@end
