//
//  Entry.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import "Entry.h"

@implementation Entry

@synthesize addressIsTemporary;

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
    [entry setTime:@[@"", @"", @"", @"", @"", @""]];
    [_entries addObject:entry];
    
    return YES;
}

+(BOOL) entryOfType: (NSString *) type
         withHeader: (NSString *) header
         andPrimary: (NSString *) primary
       andSecondary: (NSString *) secondary
           andTimes: (NSArray *) times{
    if(_entries == NULL){
        _entries = [[NSMutableArray alloc] init];
    }
    
    Entry *entry = [[Entry alloc] init];
    [entry setEntryOfType:type withHeader:header andPrimary:primary andSecondary:secondary];
    [entry setTime:times];
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

- (void)setTime:(NSArray *)times{
    self.times = times;
}


// Editing
+ (void)removeEntry: (Entry *) entry{
    [_entries removeObject:entry];
}
+ (void)clearEntries {
    _entries = [[NSMutableArray alloc] init];
}
- (void)formatTimes {
    if (self.times[0] == NULL) {
        [self setTimes:@[@"", @"", @"", @"", @"", @""]];
    }
    
    if (self.times[0] == @"-") {
        [self setTimes:@[@"", self.times[1], self.times[2], self.times[3], self.times[4], self.times[5]]];
    }
    if (self.times[1] == @"-") {
        [self setTimes:@[self.times[0], @"", self.times[2], self.times[3], self.times[4], self.times[5]]];
    }
    if (self.times[2] == @"-") {
        [self setTimes:@[self.times[0], self.times[1], @"", self.times[3], self.times[4], self.times[5]]];
    }
    if (self.times[3] == @"-") {
        [self setTimes:@[self.times[0], self.times[1], self.times[2], @"", self.times[4], self.times[5]]];
    }
    if (self.times[4] == @"-") {
        [self setTimes:@[self.times[0], self.times[1], self.times[2], self.times[3], @"", self.times[5]]];
    }
    if (self.times[5] == @"-") {
        [self setTimes:@[self.times[0], self.times[1], self.times[2], self.times[3], self.times[4], @""]];
    }
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
    if([self.times[2] isEqualToString: @""]){
        return self.header;
    }
    if([self.header length] > 30){
            return [NSString stringWithFormat:@"%@, %@", [self.header substringWithRange:NSMakeRange(0, 30)], self.times[2]];
    }
    return [NSString stringWithFormat:@"%@, %@", self.header, self.times[2]];
}

- (NSString *)getStartTimeString {
    //[self formatTimes];
    return [NSString stringWithFormat:@"%@ %@ %@", self.times[1], self.times[0], self.times[2]];
}

- (NSString *)getEndTimeString {
    //[self formatTimes];
    return [NSString stringWithFormat:@"%@ %@ %@", self.times[4], self.times[3], self.times[5]];
}

- (NSArray *)getTimes{
    return self.times;
}

// I/O
- (NSString *)entryString {
    return [NSString stringWithFormat:@"%@, %@, %@, %@\n", self.type, self.header, self.primary, self.secondary];
}
- (NSString *)stringWithFullInformationForSendingToServer {
    NSMutableString *goodString = [[NSMutableString alloc] init];
    [goodString appendString:@"{"];
    
    // Type
    [goodString appendString:@"{type:"];
    [goodString appendString:[self type]];
    [goodString appendString:@"},"];
    
    // Other information
    if (addressIsTemporary) {
        [goodString appendString:@"{address:temporary},"];
    }
    
    // Datetime
    [goodString appendString:@"{starttime:"];
    [goodString appendString:[self getStartTimeString]];
    [goodString appendString:@"},"];
    [goodString appendString:@"{endtime:"];
    [goodString appendString:[self getEndTimeString]];
    [goodString appendString:@"},"];
    
    // Header
    [goodString appendString:@"{header:"];
    [goodString appendString:[self header]];
    [goodString appendString:@"},"];
    
    // Primary
    [goodString appendString:@"{primary:"];
    [goodString appendString:[self primary]];
    [goodString appendString:@"},"];
    
    // Secondary
    [goodString appendString:@"{secondary:"];
    [goodString appendString:[self secondary]];
    [goodString appendString:@"}}"];
    
    // [NSString stringWithString:goodString]
    return [NSString stringWithString:goodString];
}


// Diagnostics
- (void)printEntry {
    NSLog([NSString stringWithFormat:@"%@, %@, %@, %@\n", self.type, self.header, self.primary, self.secondary]);
}

+ (void)printEntries {
    NSLog(@"entries:");
    for (Entry* entry in _entries) {
        [entry printEntry];
    }
}

@end
