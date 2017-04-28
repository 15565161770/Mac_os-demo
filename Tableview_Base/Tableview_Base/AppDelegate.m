//
//  AppDelegate.m
//  Tableview_Base
//
//  Created by 仝兴伟 on 2017/4/27.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.mainVC = [[MainController alloc]initWithWindowNibName:@"MainController"];
    [[self.mainVC window]center];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
