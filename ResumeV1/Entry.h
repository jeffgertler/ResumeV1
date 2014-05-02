//
//  Entry.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSMutableArray *_entries;


@interface Entry : NSObject

@property NSString *type;
@property NSString *header;
@property NSString *primary;
@property NSString *secondary;

// Initialization and adding
+(BOOL) entryOfType: (NSString *) type
         withHeader: (NSString *) header
         andPrimary: (NSString *) primary
       andSecondary: (NSString *) secondary;
-(void) setEntryOfType:(NSString *) type
            withHeader: (NSString *) header
            andPrimary: (NSString *) primary
          andSecondary: (NSString *) secondary;

// Editing
+(void) removeEntry: (Entry *) entry;
+(void) clearEntries;

// Getters
+(int) entriesSize;
+(Entry *) getObjectAt: (int) index;
+(NSArray *) entriesWithType: (NSString *) type;
+(int) numEntriesWithType: (NSString *) type;
-(NSString *) getTitle;

// I/O
- (NSString *)entryString;

// Diagnostics
-(void) printEntry;
+(void) printEntries;



@end
