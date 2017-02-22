//
//  DrawNotesViewController.m
//  DrawingBoard
//
//  Created by hipiao on 16/8/25.
//  Copyright © 2016年 James. All rights reserved.
//

#import "DrawNotesViewController.h"

@interface DrawNotesViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView * customTable;
}
@end

@implementation DrawNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUi];
}
-(void)createUi{

    [[UIDevice currentDevice]userInterfaceIdiom];
    NSLog(@"__________________%ld",(long)[[UIDevice currentDevice]userInterfaceIdiom]);
    
    NSLog(@"__________________%ld",(long)UIUserInterfaceIdiomPhone);
    
    
    
    self.view.backgroundColor = [UIColor greenColor];
    UIButton * btnBack = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
    [btnBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btnBack setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.view addSubview:btnBack];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, 30)];
    title.text = @"这很画板";
    [title setTextAlignment:NSTextAlignmentCenter];
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    
    customTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, self.view.frame.size.height-64)];
    customTable.delegate = self;
    customTable.dataSource = self;
    [self.view addSubview:customTable];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.pintArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString  * identifier = @"Cell";
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.imageView.image = [self.pintArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"这很画板";
    cell.detailTextLabel.text = @"这非常好看";
    return cell;
}
-(void)back{

    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
