//
//  MainController.m
//  Tableview_Base
//
//  Created by 仝兴伟 on 2017/4/27.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//   tableview 基本使用

#import "MainController.h"

@interface MainController ()<NSTableViewDelegate, NSTableViewDataSource>
@property (weak) IBOutlet NSTableView *tableView;
@property (strong) NSMutableArray *tableContents;

@end

@implementation MainController
- (NSString *)windowNibName {
    return @"MainController";
}
- (void)windowDidLoad {
    [super windowDidLoad];
    
    NSArray *tableData = @[@"NSQuickLookTemplate",
                           @"NSBluetoothTemplate",
                           @"NSIChatTheaterTemplate",
                           @"NSSlideshowTemplate",
                           @"NSActionTemplate",
                           @"NSSmartBadgeTemplate",
                           @"NSIconViewTemplate",
                           @"NSListViewTemplate",
                           @"NSColumnViewTemplate",
                           @"NSFlowViewTemplate",
                           @"NSPathTemplate",
                           @"NSInvalidDataFreestandingTemplate",
                           @"NSLockLockedTemplate",
                           @"NSLockUnlockedTemplate",
                           @"NSGoRightTemplate",
                           @"NSGoLeftTemplate",
                           @"NSRightFacingTriangleTemplate",
                           @"NSLeftFacingTriangleTemplate",
                           @"NSAddTemplate",
                           @"NSRemoveTemplate",
                           @"NSRevealFreestandingTemplate",
                           @"NSFollowLinkFreestandingTemplate",
                           @"NSEnterFullScreenTemplate",
                           @"NSExitFullScreenTemplate",
                           @"NSStopProgressTemplate",
                           @"NSStopProgressFreestandingTemplate",
                           @"NSRefreshTemplate",
                           @"NSRefreshFreestandingTemplate",
                           @"NSBonjour",
                           @"NSComputer",
                           @"NSFolderBurnable",
                           @"NSFolderSmart",
                           @"NSFolder",
                           @"NSNetwork",
                           @"NSMobileMe",
                           @"NSMultipleDocuments",
                           @"NSUserAccounts",
                           @"NSPreferencesGeneral",
                           @"NSAdvanced",
                           @"NSInfo",
                           @"NSFontPanel",
                           @"NSColorPanel",
                           @"NSUser",
                           @"NSUserGroup",
                           @"NSEveryone",
                           @"NSUserGuest",
                           @"NSMenuOnStateTemplate",
                           @"NSMenuMixedStateTemplate",
                           @"NSApplicationIcon",
                           @"NSTrashEmpty",
                           @"NSTrashFull",
                           @"NSHomeTemplate",
                           @"NSBookmarksTemplate",
                           @"NSCaution",
                           @"NSStatusAvailable",
                           @"NSStatusPartiallyAvailable",
                           @"NSStatusUnavailable",
                           @"NSStatusNone"];
    
    // Load up our sample data.
    _tableContents = [NSMutableArray array];
    
    // Our model consists of an array of dictionaries with Name/Image key pairs.
    for (NSString *templateImageItem in tableData) {
        NSImage *image = [NSImage imageNamed:templateImageItem];
        
        NSDictionary *dictionary = @{@"Name": templateImageItem, @"Image": image};
        [self.tableContents addObject:dictionary];
    }
    
    [self.tableView reloadData];

}


// The only essential/required tableview dataSource method.
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.tableContents.count;
}

// This method is optional if you use bindings to provide the data.
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // Group our "model" object, which is a dictionary.
    NSDictionary *dictionary = self.tableContents[row];
    
    // In IB the tableColumn has the identifier set to the same string as the keys in our dictionary.
    NSString *identifier = tableColumn.identifier;
    
    if ([identifier isEqualToString:@"MainCell"]) {
        // We pass us as the owner so we can setup target/actions into this main controller object.
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
        // Then setup properties on the cellView based on the column.
        cellView.textField.stringValue = dictionary[@"Name"];
        cellView.imageView.objectValue = dictionary[@"Image"];
        return cellView;
    } else if ([identifier isEqualToString:@"SizeCell"]) {
        NSTextField *textField = [tableView makeViewWithIdentifier:identifier owner:self];
        NSImage *image = dictionary[@"Image"];
        NSSize size = image ? image.size : NSZeroSize;
        NSString *sizeString = [NSString stringWithFormat:@"%.0fx%.0f", size.width, size.height];
        textField.objectValue = sizeString;
        return textField;
    } else {
        NSAssert1(NO, @"Unhandled table column identifier %@", identifier);
    }
    return nil;
}

@end
