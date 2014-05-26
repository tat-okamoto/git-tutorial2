//
//  BNRDocument.h
//  TahDoodle
//
//  Created by Tatsuya Okamoto on 2014/05/22.
//  Copyright (c) 2014年 KORG Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BNRDocument : NSDocument
{
    NSMutableArray *todoItems;
    IBOutlet NSTableView *itemTableView;
}

-(IBAction)createNewItem:(id)sender;
-(IBAction)deleteSelectedItem:(id)sender;

@end
