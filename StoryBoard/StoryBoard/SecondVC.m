//
//  SecondVC.m
//  StoryBoard
//
//  Created by 仝兴伟 on 17/4/19.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()
@property (strong) IBOutlet NSBox *box;

@end

@implementation SecondVC
- (instancetype)init
{
    self = [super init];
    if (self) {
         
    }
    return self;
}


-(void)viewWillAppear {
    self.box.fillColor = self.representedObject;
}

- (IBAction)dismiss:(NSButton *)sender {
    
    [self dismissController:self];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
}

@end
