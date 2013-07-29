//
//  AppDelegate.h
//  ClozeGenerator
//
//  Created by Ryaan Ahmed on 6/28/13.
//  Copyright (c) 2013 Ryaan Ahmed. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    @private
    NSMutableArray *clozeSentences;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *menubar;

@property (weak) IBOutlet NSButton *addCloze;
@property (weak) IBOutlet NSButton *export;
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSTableView *clozeList;
@property (weak) IBOutlet NSButton *removeButton;


- (IBAction) addCloze:(id)sender;
- (IBAction) exportAll:(id)sender;
- (IBAction) removeCloze:(id)sender;

@end
