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

+ (void)setDefaultTypes {
    
    // Make note of our special "default" types
    _specialTypes = @[@"Education", @"Employment", @"Skills"];
    
    // Set everything up pretty-like
    _specialTypeOverrides = @{@"Education"  : @[@"Institution Name", @"Degree", @"More Info"],
                              @"Employment" : @[@"Company", @"Position", @"Other Info"],
                              @"Skills"     : @[@"Header", @"Other Info", @"NULL"]
                              };
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

+ (void)setTemplateNumber:(int)number{
    _templateNumber = number;
}
+ (int)getTemplateNumber{
    return _templateNumber;
}


+ (void)saveState{
    [self resetDefaults];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"yes" forKey:@"isDataSaved"];
    // Saving _entries
    [defaults setObject:[NSString stringWithFormat:@"%d", [Entry entriesSize]] forKey:@"numEntries"];
    for (int i=0; i<[Entry entriesSize]; i++) {
        [defaults setObject:[Entry getObjectAt:i].type forKey:[NSString stringWithFormat:@"entry%dtype", i]];
        [defaults setObject:[Entry getObjectAt:i].header forKey:[NSString stringWithFormat:@"entry%dheader", i]];
        [defaults setObject:[Entry getObjectAt:i].primary forKey:[NSString stringWithFormat:@"entry%dprimary", i]];
        [defaults setObject:[Entry getObjectAt:i].secondary forKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
    }
    // Saving _types
    [defaults setObject:[NSString stringWithFormat:@"%d", [self typesSize]] forKey:@"numTypes"];
    for (int i=0; i<[self typesSize]; i++){
        [defaults setObject:[self getTypeAt:i] forKey:[NSString stringWithFormat:@"type%d", i]];
    }
    //Saving _primaryEmail, _secondaryEmail, _useSecondaryEmail
    [defaults setObject:_primaryEmail forKey:@"primaryEmail"];
    [defaults setObject:_secondaryEmail forKey:@"secondaryEmail"];
    if(_useSecondaryEmail){
        [defaults setObject:@"YES" forKey:@"useSecondaryEmail"];
    } else {
        [defaults setObject:@"NO" forKey:@"useSecondaryEmail"];
    }
    [defaults synchronize];
}

+ (void)loadState{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([[defaults objectForKey:@"isDataSaved"] isEqualToString:@"yes"]) {
        [Entry clearEntries];
        // Loading entries
        for (int i=0; i<[[defaults objectForKey:@"numEntries"] intValue]; i++) {
            NSString *type = [defaults objectForKey:[NSString stringWithFormat:@"entry%dtype", i]];
            NSString *header = [defaults objectForKey:[NSString stringWithFormat:@"entry%dheader", i]];
            NSString *primary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dprimary", i]];
            NSString *secondary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
            [Entry entryOfType:type withHeader:header andPrimary:primary andSecondary:secondary];
        }
        // Loading _types
        for (int i=0; i<[[defaults objectForKey:@"numTypes"] intValue]; i++) {
            [self addType:[defaults objectForKey:[NSString stringWithFormat:@"type%d", i]]];
        }
        // Loading _primaryEmail, _secondaryEmail, _useSecondaryEmail
        _primaryEmail = [defaults objectForKey:@"primaryEmail"];
        _secondaryEmail = [defaults objectForKey:@"secondaryEmail"];
        _useSecondaryEmail = [[defaults objectForKey:@"useSecondaryEmail"] isEqual:@"YES"];
    } else {
        NSLog(@"Nothing saved");
    }
    
    
    
}



+ (NSArray *)specialTypes {
    return _specialTypes;
}

+ (NSDictionary *)specialTypeOverrides {
    return _specialTypeOverrides;
}


+ (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

+(void) makeSample:(int)version {
    [GlobalData resetDefaults];
    
    if (version == 0) {
        [GlobalData addType:@"Contact"];
        [GlobalData addType:@"Education"];
        [GlobalData addType:@"Employment"];
        [GlobalData addType:@"Skills"];
        [GlobalData addType:@"Publications"];
        [GlobalData addType:@"Awards"];
        [GlobalData addType:@"Honors"];
        
        [Entry entryOfType:@"Contact"
                withHeader:@"Roger Darling"
                andPrimary:@"johnsmith@gmail.com\n(111) 111-1111"
              andSecondary:@"123 Broadway\n New York, NY, 12345"];
        
        [Entry entryOfType:@"Contact"
                withHeader:@"Roger Darling"
                andPrimary:@"johnsmith@gmail.com\n(111) 111-1111"
              andSecondary:@"19 Tibbits Avenue\n Troy, NY, 12180"];
        [[Entry getObjectAt:[Entry entriesSize]-1] setTime:@[@"1", @"January", @"2004", @"1", @"January", @"2010"]];
        
        [Entry entryOfType:@"Education"
                withHeader:@"Rensselaer Polytechnic Institute, Troy, NY"
                andPrimary:@"B.S., Electrical Engineering"
              andSecondary:@""];
        
        [Entry entryOfType:@"Employment"
                withHeader:@"A & P Supermarket, Madison, NJ"
                andPrimary:@"Meat Department Assistant"
              andSecondary:@"Assisted department manager with ordering, pricing, and maintaining department inventory."];
        
        [Entry entryOfType:@"Skills"
                withHeader:@"Languages and Software"
                andPrimary:@"COBOL, IFPS, Focus, Megacalc, Pascal, Modula2, C, APL, SNOBOL, FORTRAN, LISP, SPIRES, BASIC, VSPC Autotab"
              andSecondary:@""];
        
        [Entry entryOfType:@"Honors"
                withHeader:@"Dean's List"
                andPrimary:@"Rensselaer Polytechnic Institute"
              andSecondary:@""];
        
        [Entry entryOfType:@"Honors"
                withHeader:@"Clayton and Mary Shelley Scholarship"
                andPrimary:@"Rensselaer Polytechnic Institute"
              andSecondary:@""];
        
        [Entry entryOfType:@"Honors"
                withHeader:@"United Food and Commercial Workers Union Scholarship"
                andPrimary:@"National Honor Society"
              andSecondary:@""];
        
        [Entry entryOfType:@"Awards"
                withHeader:@"Salutatorian Medal"
                andPrimary:@"Mayfield Central School, NY"
              andSecondary:@"2010, 2011, 2012"];
    }
}

+ (NSString *)versionNumber {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [info objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)stringForServer {
    NSMutableString *s = [[NSMutableString alloc]init];

    [s appendString:@"{"];
    
    // Add config information
    [s appendString:[NSString stringWithFormat:@"{template:%d},", [GlobalData getTemplateNumber]]];
    [s appendString:[NSString stringWithFormat:@"{p_email:%@},", [GlobalData primaryEmail]]];
    if ([[GlobalData secondaryEmail] length] != 0) {
        [s appendString:[NSString stringWithFormat:@"{S_email:%@},", [GlobalData secondaryEmail]]];
    }
    [s appendString:@"{secondaries:("];
    [s appendString:[_entriesNeedingSecondaries componentsJoinedByString:@","]];
    [s appendString:@")},"];
    
    // Add relevant entries
    for (int i=0; i<[_readyEntries count]; i++) {
        [s appendString:[_readyEntries[i] stringWithFullInformationForSendingToServer]];
    }
    
    // Close
    [s appendString:@"}"];
    
    return [NSString stringWithString:s];
}

+ (void)printReadyEntries {
    for (int i=0; i<[_readyEntries count]; i++) {
        [_readyEntries[i] printEntry];
    }
}

// Configuration stuff
+ (void)setUseSecondaryEmail:(BOOL)use {
    _useSecondaryEmail = use;
}
+ (BOOL)useSecondaryEmail {
    return _useSecondaryEmail;
}
+ (void)setPrimaryEmail:(NSString *)s {
    // This may not be the best way to do this
    _primaryEmail = [[NSMutableString alloc] initWithString:s];
}
+ (void)setSecondaryEmail:(NSString *)s {
    _secondaryEmail = [[NSMutableString alloc] initWithString:s]; // Ditto
}

+ (void)setEntriesNeedingSecondaries:(NSMutableArray *)entries {
    _entriesNeedingSecondaries =[[NSMutableArray alloc] init];
    for(Entry *entry in entries){
        [_entriesNeedingSecondaries addObject: [NSNumber numberWithInt:[_readyEntries indexOfObject:entry]]];
    }
}

+ (NSString *)primaryEmail {
    return _primaryEmail;
}
+ (NSString *)secondaryEmail {
    return _secondaryEmail;
}


@end
