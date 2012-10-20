//
//  JPRootViewController.h
//  RenrenDemo
//
//  Created by Jacob Pan on 12-10-20.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPFriendsListViewController.h"

@interface JPRootViewController : UIViewController <RenrenDelegate>
{
    JPFriendsListViewController *friendsListVC;
    UIButton *loginBtn;
    UIButton *getFriendsBtn;
}

@end
