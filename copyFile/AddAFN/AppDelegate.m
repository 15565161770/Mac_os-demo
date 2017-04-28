//
//  AppDelegate.m
//  AddAFN
//
//  Created by 仝兴伟 on 2017/4/26.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.mainWindow = [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];
    [[self.mainWindow window]center];
    [self.mainWindow.window orderFront:nil];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
