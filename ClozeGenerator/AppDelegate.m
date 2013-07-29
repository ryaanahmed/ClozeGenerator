//
//  AppDelegate.m
//  ClozeGenerator
//
//  Created by Ryaan Ahmed on 6/28/13.
//  Copyright (c) 2013 Ryaan Ahmed. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
    clozeSentences = [[NSMutableArray alloc] initWithCapacity:1];
}

- (int) numberOfRowsInTableView:(NSTableView *)tableView
{
    return (int)[clozeSentences count];
}

- (id) tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(int)row
{
    return [[clozeSentences objectAtIndex:row] objectAtIndex:1];
}


- (IBAction) addCloze:(id)sender
{
    NSString *clozeSentence = [_textView.string stringByReplacingCharactersInRange:[_textView selectedRange] withString:@"..."];
    NSString *clozeAnswer = [_textView.string substringWithRange:[_textView selectedRange]];
    
    NSArray *cloze = @[clozeSentence, clozeAnswer];
    
    [clozeSentences addObject:cloze];
    [_clozeList reloadData];
}


- (IBAction) exportAll:(id)sender
{
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop"] stringByAppendingPathComponent:@"cloze.txt"];

    NSString *output = @"";
    for (id cloze in clozeSentences)
    {
        NSString *clozeSentence = [cloze objectAtIndex:0];
        NSString *clozeAnswer = [cloze objectAtIndex:1];
        
        NSString *totalCloze = [[clozeSentence stringByAppendingString:@"\n"] stringByAppendingString:clozeAnswer];
        
        output = [[output stringByAppendingString:(NSString *)totalCloze] stringByAppendingString:@"\n\n"];
    }
    
    [output writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    [[NSPasteboard generalPasteboard] clearContents];
    NSArray *copiedObjects = [NSArray arrayWithObject:output];
    [[NSPasteboard generalPasteboard] writeObjects:copiedObjects];

    clozeSentences = [[NSMutableArray alloc] initWithCapacity:1];
    [_clozeList reloadData];
    _textView.string = @"";
}

- (IBAction)removeCloze:(id)sender
{
    [clozeSentences removeObjectAtIndex:_clozeList.selectedRow];
    [_clozeList reloadData];    
}

@end
