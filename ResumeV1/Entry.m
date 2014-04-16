//
//  Entry.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import "Entry.h"

@implementation Entry


// Initialization and adding
+(BOOL) entryOfType: (NSString *) type
             withHeader: (NSString *) header
             andPrimary: (NSString *) primary
           andSecondary: (NSString *) secondary {
    if(_entries == NULL){
        _entries = [[NSMutableArray alloc] init];
    }
    
    Entry *entry = [[Entry alloc] init];
    [entry setEntryOfType:type withHeader:header andPrimary:primary andSecondary:secondary];
    [_entries addObject:entry];
    
    return YES;
}

- (void)setEntryOfType:(NSString *) type
            withHeader:(NSString *) header
            andPrimary:(NSString *) primary
          andSecondary:(NSString *) secondary {
    self.type = type;
    self.header = header;
    self.primary = primary;
    self.secondary = secondary;
}


// Editing
+(void) removeEntry: (Entry *) entry{
    [_entries removeObject:entry];
}
+(void) clearEntries {
    _entries = [[NSMutableArray alloc] init];
}


// Getters
+(int) entriesSize {
    return [_entries count];
}

+ (Entry *)getObjectAt:(int)index {
    return _entries[index];
}

+ (NSArray *)entriesWithType:(NSString *)type {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i=0; i<[_entries count]; i++) {
        if ([[self getObjectAt:i].type isEqualToString:type]) {
            [array addObject:[self getObjectAt:i]];
        }
    }
    return array;
}


+ (int)numEntriesWithType:(NSString *)type {
    int count = 0;
    for (Entry* entry in _entries) {
        if ([entry.type isEqualToString:type]) {
            count++;
        }
    }
    return count;
}
-(NSString *) getTitle {
    return self.header;
}


// Diagnostics
-(void) printEntry {
    NSLog([NSString stringWithFormat:@"%@, %@, %@, %@\n", self.type, self.header, self.primary, self.secondary]);
}

+ (void)printEntries {
    NSLog(@"entries:");
    for (Entry* entry in _entries) {
        [entry printEntry];
    }
}

@end
