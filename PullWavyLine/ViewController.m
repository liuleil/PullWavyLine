//
//  ViewController.m
//  PullWavyLine
//
//  Created by leileigege on 2017/1/4.
//  Copyright © 2017年 leileigege. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "LLWavyLineView.h"
#import "LLTableViewCell.h"


@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIScrollView *scroView;
@property (weak, nonatomic) IBOutlet LLWavyLineView *wavyLineView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property(nonatomic,assign) float viewHeight;
@property(nonatomic,assign) float headY;
@property(nonatomic,assign) float nameY;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewHeight = 200;
    self.headImage.center = CGPointMake(SCREEN_WIDTH/2.0, 100);
    self.nameLab.center = CGPointMake(SCREEN_WIDTH/2.0, 150);
    self.headY = self.headImage.center.y;
    self.nameY = self.nameLab.center.y;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.y <= 0) {
        self.wavyLineView.lineHeight = - scrollView.contentOffset.y;
        self.wavyLineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.viewHeight+ ( - scrollView.contentOffset.y));
        self.headImage.center = CGPointMake(self.headImage.center.x, self.headY+(- scrollView.contentOffset.y)/2.0);
        self.nameLab.center = CGPointMake(self.nameLab.center.x, self.nameY+(- scrollView.contentOffset.y)/2.0);
    }
}
#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.numLab.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
