//
//  JPAppDelegate.h
//  RenrenDemo
//
//  Created by Jacob Pan on 12-10-20.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPRootViewController.h"

@interface JPAppDelegate : UIResponder <UIApplicationDelegate>
{
    JPRootViewController *rootViewController;
}
@property (strong, nonatomic) UIWindow *window;

@end
