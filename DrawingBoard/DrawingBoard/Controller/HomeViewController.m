//
//  HomeViewController.m
//  Painter
//
//  Created by  ibokan on 10-9-7.
//  Copyright 2010 tencent.com. All rights reserved.
//

#import "HomeViewController.h"

#import "DrawNotesViewController.h"
#import "PainterView.h"
@interface HomeViewController ()<UIAlertViewDelegate>
{
    int    index;
    BOOL   isShowTab;
    BOOL   isShowColor;
    UIView * shareView;
    UIButton * btnTag;
    UIButton * btnClear;
    UIButton * btnFinish;
    UIButton * btnColor;
    UIButton * btnNotes;
    UIScrollView * scCollor;
    
    
    NSMutableArray * pintArray;
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMine];
    [self createUi];
}
-(void)createUi{

    btnTag = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, 40, 30)];
    [btnTag addTarget:self action:@selector(moreTag) forControlEvents:UIControlEventTouchUpInside];
    [btnTag setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    btnTag.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btnTag];
}
-(void)initMine
{
    pintArray = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    _painterView = [[PainterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_painterView];
}
-(void)moreTag{

    if (!isShowTab) {
        isShowTab = YES;
        [shareView  removeFromSuperview];
        shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 90, 0, 0)];
        [self.view addSubview:shareView];
        shareView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];

        btnNotes = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [btnNotes addTarget:self action:@selector(notes) forControlEvents:UIControlEventTouchUpInside];
        [btnNotes setTitle:@"记录" forState:UIControlStateNormal];
        [btnNotes setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [shareView addSubview:btnNotes];
        
        btnClear = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [btnClear addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
        [btnClear setTitle:@"清除" forState:UIControlStateNormal];
        [btnClear setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [shareView addSubview:btnClear];
        
        btnFinish = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [btnFinish addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
        [btnFinish setTitle:@"完成" forState:UIControlStateNormal];
        [btnFinish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [shareView addSubview:btnFinish];
        btnColor = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [btnColor addTarget:self action:@selector(erase) forControlEvents:UIControlEventTouchUpInside];
        [btnColor setTitle:@"颜色" forState:UIControlStateNormal];
        [btnColor setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [shareView addSubview:btnColor];
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [btnTag setImage:[UIImage imageNamed:@"Down"] forState:UIControlStateNormal];
            btnTag.frame    = CGRectMake(0, 60, 100, 30);
            shareView.frame = CGRectMake(0, 90, 100, 170);
            btnNotes.frame  = CGRectMake(10, 10, 80, 30);
            btnClear.frame  = CGRectMake(10, 50, 80, 30);
            btnFinish.frame = CGRectMake(10, 90, 80, 30);
            btnColor.frame  = CGRectMake(10, 130, 80, 30);
        }];
    }else{
        isShowTab = NO;
        [UIView animateWithDuration:0.5 animations:^{
            [btnTag setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
            btnTag.frame     = CGRectMake(0, 60, 40, 30);
            shareView.frame  = CGRectMake(0, 90, 0, 0);
            scCollor.frame   = CGRectMake(0, 90, 0, 0);
            btnNotes.hidden  = YES;
            btnClear.hidden  = YES;
            btnColor.hidden  = YES;
            btnFinish.hidden = YES;
        }];
    }
}
-(void)notes{

    DrawNotesViewController * notes = [[DrawNotesViewController alloc]init];
    notes.pintArray = pintArray;
    [self presentViewController:notes animated:YES completion:nil];
}
-(void) erase
{
    
    if (!isShowColor) {
        isShowColor = YES;
        [scCollor  removeFromSuperview];
        NSArray * array = @[[UIColor redColor],[UIColor brownColor],[UIColor magentaColor],[UIColor blackColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor greenColor],[UIColor groupTableViewBackgroundColor],[UIColor cyanColor]];
        scCollor = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 260, 0, 0)];
        scCollor.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
        scCollor.contentSize = CGSizeMake(0, 30*array.count+10);
        [self.view addSubview:scCollor];
        for (int i= 0; i<array.count; i ++) {
            UIView *vColor = [[UIView alloc]initWithFrame:CGRectMake(10, 10+30*i, 80, 30)];
            vColor.tag = 2000+i;
            [scCollor addSubview:vColor];
            UILabel * lbColor = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 80, 10)];
            lbColor.backgroundColor = [array objectAtIndex:i];
            lbColor.userInteractionEnabled = YES;
            
            [vColor addSubview:lbColor];
            UITapGestureRecognizer * tapSize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSize:)];
            tapSize.numberOfTapsRequired     = 1;
            tapSize.numberOfTouchesRequired  = 1;
            [vColor addGestureRecognizer:tapSize];
        }
        [UIView animateWithDuration:0.5 animations:^{
            scCollor.frame = CGRectMake(0, 260, 100, 150);
        }];
    }else{
        isShowColor = NO;
        [UIView animateWithDuration:0.5 animations:^{
            scCollor.frame = CGRectMake(0, 90, 0, 0);
        }];
    }
    
    
   }
-(void)tapSize:(UITapGestureRecognizer *)tap
{
    [_painterView erase:(int)tap.view.tag];
}
-(void) clear
{
	[_painterView resetView];
}

-(void) finish
{
    //绘制完成是否保存
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"是否存储画作" message:nil delegate:self cancelButtonTitle:@"存储" otherButtonTitles:@"取消", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {
        [pintArray addObject:[_painterView screenshot]];
        [_painterView resetView];
    }

}
@end
