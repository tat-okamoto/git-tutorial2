//
//  BNRDocument.m
//  TahDoodle
//  poooooooooooooooooohhhhhhhhhhhhhhhhhhhhhhhhhhh
//  Created by Tatsuya Okamoto on 2014/05/22.
//  Copyright (c) 2014年 KORG Inc. All rights reserved.
//

#import "BNRDocument.h"

@implementation BNRDocument

#pragma mark - NSDocument Overrides

- (NSString *)windowNibName
{
    return @"BNRDocument";
}

#pragma mark - Actions

- (IBAction)createNewItem:(id)sender
{
    if (!todoItems) todoItems = [NSMutableArray array];
    [todoItems addObject:@"New Item"];
    [itemTableView reloadData];
    [self updateChangeCount:NSChangeDone];
}

- (IBAction)deleteSelectedItem:(id)sender
{
    if([itemTableView selectedRow] != -1){
        [todoItems removeObjectAtIndex:[itemTableView selectedRow]];
        [itemTableView reloadData];
        [self updateChangeCount:NSChangeDone];
    }
}

#pragma mark - Data Source Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return [todoItems count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    return [todoItems objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row
{
    [todoItems replaceObjectAtIndex:row withObject:object];
    [self updateChangeCount:NSChangeDone];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName
                 error:(NSError **)outError
{
    if (!todoItems){
        todoItems = [NSMutableArray array];
    }
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:todoItems
                                                              format:NSPropertyListXMLFormat_v1_0
                                                             options:0
                                                               error:outError];
    return data;
}

- (BOOL)readFromData:(NSData *)data
              ofType:(NSString *)typeName
               error:(NSError **)outError
{
    todoItems = [NSPropertyListSerialization propertyListWithData:data
                                                          options:NSPropertyListMutableContainers
                                                           format:NULL
                                                            error:outError];
    return (todoItems != nil);
}

@end
