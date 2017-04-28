//
//  ViewController.m
//  StoryBoard
//
//  Created by 仝兴伟 on 17/4/19.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"
@interface ViewController ()
@property (strong) IBOutlet NSColorWell *well;
@property (nonatomic, strong) SecondVC *second;
@end

@implementation ViewController

#pragma mark -- 颜色方法
- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
{
    self.second = segue.destinationController;
    self.second.representedObject = self.well.color;
}




- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
