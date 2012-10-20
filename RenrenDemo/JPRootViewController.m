//
//  JPRootViewController.m
//  RenrenDemo
//
//  Created by Jacob Pan on 12-10-20.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import "JPRootViewController.h"

@interface JPRootViewController ()

-(void)loginRenren;
- (void)showFriendsView;

@end

@implementation JPRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //登录按钮的添加
    loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn setFrame:CGRectMake(150, 150, 100, 40)];
    [loginBtn addTarget:self action:@selector(loginRenren) forControlEvents:UIControlEventTouchUpInside];
    
    getFriendsBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [getFriendsBtn setFrame:CGRectMake(150, 220, 100, 40)];
    [getFriendsBtn addTarget:self action:@selector(showFriendsView) forControlEvents:UIControlEventTouchUpInside];
    [getFriendsBtn setTitle:@"好友列表" forState:UIControlStateNormal];
    
    if (![[Renren sharedRenren] isSessionValid])
    {
        [loginBtn setTitle:@"login" forState:UIControlStateNormal];
        [getFriendsBtn setEnabled:NO];
    }
    else
    {
        [loginBtn setTitle:@"logout" forState:UIControlStateNormal];
        [getFriendsBtn setEnabled:YES];
    }
    
    [self.view addSubview:loginBtn];
    [self.view addSubview:getFriendsBtn];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - Mark Private Method
- (void)loginRenren
{
    if (![[Renren sharedRenren] isSessionValid])
    {
        [[Renren sharedRenren] authorizationWithPermisson:nil andDelegate:self];
    }
    else
    {
        [[Renren sharedRenren] logout:self];
    }
    
}

- (void)showFriendsView
{
    friendsListVC = [[JPFriendsListViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self presentModalViewController:friendsListVC animated:YES];
}

#pragma - Mark Renren Delegate
- (void)renrenDidLogin:(Renren *)renren
{
    [loginBtn setTitle:@"logout" forState:UIControlStateNormal];
    NSLog(@"登录成功");
    
    [self showFriendsView];
}

- (void)renrenDidLogout:(Renren *)renren
{
    [loginBtn setTitle:@"login" forState:UIControlStateNormal];
    NSLog(@"退出成功");
}

@end
