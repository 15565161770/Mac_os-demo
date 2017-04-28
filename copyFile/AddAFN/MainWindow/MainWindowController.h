//
//  MainWindowController.h
//  AddAFN
//
//  Created by 仝兴伟 on 2017/4/26.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController
{
    
    NSFileManager *fm; // NSFileManager
    NSMutableDictionary *dicPath; //可变字典
    dispatch_semaphore_t semaphore; // 信号量控制并发
    
}
@end
