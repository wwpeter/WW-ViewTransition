//
//  KCFriendViewController.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCFriendViewController.h"
#import "KCQQContactViewController.h"

@interface KCFriendViewController ()

@end

@implementation KCFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //每次出栈都会销毁相应的子控制器
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    
    //在子视图中可以通过navigationController属性访问导航控制器，
    //同时对于当前子视图来说其父控制器就是其导航控制器
    NSLog(@"%i",self.navigationController==self.parentViewController);
    
    //在子视图中（或者根视图）有一个navigationItem用于访问其导航信息
    self.navigationItem.title=@"Friends";//或者直接设置控制器title（例如[self setTitle:@"Friends"]）
    //设置导航栏左侧按钮
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonSystemItemAdd target:nil action:nil];
    //设置导航栏右侧按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ff_IconAdd.png"] style:UIBarButtonItemStyleDone target:self action:@selector(addFriends)];
    
    //修改当在下一级子视图中出现的左侧的返回按钮的内容
    UIBarButtonItem *backItem=self.navigationItem.backBarButtonItem;
    backItem.title=@"Add Friends";

}

-(void)addFriends{
    //通过push导航到另外一个子视图
    KCQQContactViewController *qqContactController=[[KCQQContactViewController alloc]init];
    [self.navigationController pushViewController:qqContactController animated:YES];
}
@end
