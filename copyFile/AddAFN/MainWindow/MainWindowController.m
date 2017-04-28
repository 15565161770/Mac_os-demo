//
//  MainWindowController.m
//  AddAFN
//
//  Created by 仝兴伟 on 2017/4/26.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "MainWindowController.h"
#import "AFNTool.h"
@interface MainWindowController ()
@property (strong) IBOutlet NSTextField *userName;
@property (strong) IBOutlet NSTextField *passWord;
@property (strong) IBOutlet NSProgressIndicator *progress;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.title = @"登录";
    dicPath = [NSMutableDictionary dictionaryWithCapacity:2];
    semaphore=dispatch_semaphore_create(1);
    self.progress.hidden = YES;
}

// 选取文件路径
- (IBAction)LoginButton:(NSButton *)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        @autoreleasepool {
            fm = [NSFileManager defaultManager];
            NSOpenPanel *oPanel = [NSOpenPanel openPanel];
            [oPanel setCanChooseDirectories:YES];
            [oPanel setCanChooseFiles:YES];
            
            if ([oPanel runModal] == NSOKButton) {
                NSString *str =[[[oPanel URLs] objectAtIndex:0] path];
                [dicPath setValue:str forKey:@"copyPath"];
                
                [self.userName setStringValue:str];
                
                NSLog(@"OK");
            }else{
                NSLog(@"Cancel");
            }
        }
    });

}

// 存放文件路径
- (IBAction)paseFile:(NSButton *)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        @autoreleasepool {
            NSOpenPanel *oPanel = [NSOpenPanel openPanel];
            [oPanel setCanChooseDirectories:YES];
            [oPanel setCanChooseFiles:NO];
            if ([oPanel runModal] == NSOKButton) {  //如果用户点OK
                NSString *str =[[[oPanel URLs] objectAtIndex:0] path];
                
                [dicPath setValue:str forKey:@"pastePath"];
                
                [self.passWord setStringValue:str];
                
                NSLog(@"OK");
            }else{
                NSLog(@"Cancel");
                
            }
        }
    });

}


// 复制文件路径
- (IBAction)copyButton:(NSButton *)sender {
    self.progress.hidden = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),^{
        
        dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.progress startAnimation:nil];
        });
        [self copyFileToPath];
        
        dispatch_semaphore_signal(semaphore);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.progress stopAnimation:nil];
            self.progress.hidden = YES;
        });
    });
}


-(void)copyFileToPath{
    
    NSString *str = [dicPath objectForKey:@"copyPath"];
    NSArray *arrFileName =[str componentsSeparatedByString:NSLocalizedString(@"/", nil)];
    NSString *pasteStr = [[[dicPath objectForKey:@"pastePath"] stringByAppendingString:@"/"] stringByAppendingString:[arrFileName lastObject]];
    
    BOOL isDir = NO;
    NSError* error=nil;
    BOOL existed = [fm fileExistsAtPath:pasteStr isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fm removeItemAtPath:pasteStr error:nil];
    }
    [fm copyItemAtPath:[dicPath objectForKey:@"copyPath"] toPath:pasteStr error:&error];
    if (error!=nil) {
        NSLog(@"%@", error);
        NSLog(@"%@", [error userInfo]);
    }
    //    [dicPath removeAllObjects];
}


@end
