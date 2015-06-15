//
//  ViewController.m
//  segmentdemo
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *arrs;
@end

@implementation ViewController
-(NSArray *)arrs
{
    if (_arrs==nil) {
        oneViewController *one = [oneViewController new];
        one.view.backgroundColor = [UIColor redColor];
        twoViewController *two = [twoViewController new];
        two.view.backgroundColor = [UIColor blueColor];
        threeViewController *three = [threeViewController new];
        three.view.backgroundColor = [UIColor greenColor];
        _arrs = [NSArray arrayWithObjects:one.view,two.view,three.view, nil];
    }
    return _arrs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",nil];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:arr];
    CGFloat W = 100;
    CGFloat H = 44;
    CGFloat X = ([UIScreen mainScreen].bounds.size.width - W)/2 ;
    CGFloat Y = self.navigationController.navigationBar.frame.size.height-44;
   

    seg.frame = CGRectMake(X, Y, W, H);
    
    
    [seg addTarget:self action:@selector(changeclick:) forControlEvents:UIControlEventValueChanged];
    [self.navigationController.navigationBar addSubview:seg];
    seg.selectedSegmentIndex = 0;
    oneViewController *one = [[oneViewController alloc]init];
    one.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.arrs[0]];
    [self.view addSubview:self.arrs[1]];
    [self.view addSubview:self.arrs[2]];
    [self.view bringSubviewToFront:self.arrs[0]];
}

-(void)changeclick:(id)sender
{
    UISegmentedControl *con = (UISegmentedControl *)sender;
    int num = [con selectedSegmentIndex];
    
    [self.view.superview addSubview:self.arrs[num]];
    NSLog(@"%d",self.view.superview.subviews.count);
    
   
}


@end
