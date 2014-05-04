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
@property NSArray *times; // [startingDay, startingMonth, startingYear, endDay, endMonth, endYear] empty fields will have a "-" instead of a normal string
@property BOOL addressIsTemporary;

// Initialization and adding
+(BOOL) entryOfType: (NSString *) type
         withHeader: (NSString *) header
         andPrimary: (NSString *) primary
       andSecondary: (NSString *) secondary;
-(void) setEntryOfType:(NSString *) type
            withHeader: (NSString *) header
            andPrimary: (NSString *) primary
          andSecondary: (NSString *) secondary;
- (void)setTime:(NSArray *)times;

// Editing
+(void) removeEntry: (Entry *) entry;
+(void) clearEntries;

// Getters
+(int) entriesSize;
+(Entry *) getObjectAt: (int) index;
+(NSArray *) entriesWithType: (NSString *) type;
+(int) numEntriesWithType: (NSString *) type;
-(NSString *) getTitle;
-(NSString *) getStartTimeString;
-(NSString *) getEndTimeString;

// I/O
- (NSString *)entryString;
- (NSString *)stringWithFullInformationForSendingToServer;

// Diagnostics
-(void) printEntry;
+(void) printEntries;



@end
