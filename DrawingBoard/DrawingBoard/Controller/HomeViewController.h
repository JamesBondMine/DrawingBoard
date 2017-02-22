//
//  HomeViewController.h
//  Painter
//
//  Created by  ibokan on 10-9-7.
//  Copyright 2010 tencent.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PainterView;

@interface HomeViewController : UIViewController
{
	PainterView *_painterView;
	UIToolbar *_toolbar;
}

@end
