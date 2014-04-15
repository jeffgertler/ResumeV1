//
//  GlobalData.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/6/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import "GlobalData.h"
#import "Entry.h"

@implementation GlobalData

+ (BOOL)addType:(NSString *) newType{
    if (_types == NULL) {
        _types =[[NSMutableArray alloc] init];
    }
    for(NSString *type in _types) {
        if([type isEqualToString:newType]){
            return NO;
        }
    }
    [_types addObject:newType];
    return YES;
}

+ (void)setReadyEntries:(NSMutableArray *)entries{
    _readyEntries = entries;
}

+ (int)messageSize {
    return _MSG_SIZE;
}

+ (int)typesSize {
    return [_types count];
}

+ (NSString *)getTypeAt:(int)index{
    return [_types objectAtIndex:index];
}

+(int) readyEntriesSize {
    return [_readyEntries count];
}

+ (Entry *)getReadyObjectAt:(int)index {
    return _readyEntries[index];
}

+ (NSArray *)readyEntriesWithType:(NSString *)type {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i=0; i<[_readyEntries count]; i++) {
        if ([[self getReadyObjectAt:i].type isEqualToString:type]) {
            [array addObject:[self getReadyObjectAt:i]];
        }
    }
    return array;
}


+ (int)numReadyEntriesWithType:(NSString *)type {
    int count = 0;
    for (Entry* entry in _readyEntries) {
        if ([entry.type isEqualToString:type]) {
            count++;
        }
    }
    return count;
}

+ (void)saveEntries{
    [self resetDefaults];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"yes" forKey:@"isDataSaved"];
    [defaults setObject:[NSString stringWithFormat:@"%d", [Entry entriesSize]] forKey:@"numEntries"];
    for (int i=0; i<[Entry entriesSize]; i++) {
        [defaults setObject:[Entry getObjectAt:i].type forKey:[NSString stringWithFormat:@"entry%dtype", i]];
        [defaults setObject:[Entry getObjectAt:i].header forKey:[NSString stringWithFormat:@"entry%dheader", i]];
        [defaults setObject:[Entry getObjectAt:i].primary forKey:[NSString stringWithFormat:@"entry%dprimary", i]];
        [defaults setObject:[Entry getObjectAt:i].secondary forKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
    }
    [defaults synchronize];
}

+ (void)loadEntries{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"isDataSaved"] isEqualToString:@"yes"]) {
        [Entry clearEntries];
        for (int i=0; i<[[defaults objectForKey:@"numEntries"] intValue]; i++) {
            NSString *type = [defaults objectForKey:[NSString stringWithFormat:@"entry%dtype", i]];
            NSString *header = [defaults objectForKey:[NSString stringWithFormat:@"entry%dheader", i]];
            NSString *primary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dprimary", i]];
            NSString *secondary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
            [Entry entryOfType:type withHeader:header andPrimary:primary andSecondary:secondary];
        }
    }
}

+ (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

+ (NSString *)versionNumber {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [info objectForKey:@"CFBundleShortVersionString"];
}

@end
