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
    _specialTypes = @[@"Contact", @"Education", @"Employment", @"Skills"];
    
    // Set everything up pretty-like
    _specialTypeOverrides = @{@"Contact"    : @[@"Name", @"Email and Phone Number", @"Address"],
                              @"Education"  : @[@"Institution Name", @"Degree", @"More Info"],
                              @"Employment" : @[@"Company", @"Position", @"Other Info"],
                              @"Skills"     : @[@"Header", @"Other Info", @"NULL"],
                              @"Research"   : @[@"Organization", @"Position", @"Other Info"]
                              };
    
    _typesNeedingSecondaries = @[@"Contact"];
    
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

+ (NSMutableArray *)getReadyEntries {
    return _readyEntries;
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
        [defaults setObject:[Entry getObjectAt:i].times[0] forKey:[NSString stringWithFormat:@"entry%dtime0", i]];
        [defaults setObject:[Entry getObjectAt:i].times[1] forKey:[NSString stringWithFormat:@"entry%dtime1", i]];
        [defaults setObject:[Entry getObjectAt:i].times[2] forKey:[NSString stringWithFormat:@"entry%dtime2", i]];
        [defaults setObject:[Entry getObjectAt:i].times[3] forKey:[NSString stringWithFormat:@"entry%dtime3", i]];
        [defaults setObject:[Entry getObjectAt:i].times[4] forKey:[NSString stringWithFormat:@"entry%dtime4", i]];
        [defaults setObject:[Entry getObjectAt:i].times[5] forKey:[NSString stringWithFormat:@"entry%dtime5", i]];
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
    [Entry clearEntries];
    
    if ([[defaults objectForKey:@"isDataSaved"] isEqualToString:@"yes"]) {
        [Entry clearEntries];
        [self clearData];
        // Loading entries
        for (int i=0; i<[[defaults objectForKey:@"numEntries"] intValue]; i++) {
            NSString *type = [defaults objectForKey:[NSString stringWithFormat:@"entry%dtype", i]];
            NSString *header = [defaults objectForKey:[NSString stringWithFormat:@"entry%dheader", i]];
            NSString *primary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dprimary", i]];
            NSString *secondary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
            NSArray *times = @[[defaults objectForKey:[NSString stringWithFormat:@"entry%dtime0", i]],
                               [defaults objectForKey:[NSString stringWithFormat:@"entry%dtime1", i]],
                               [defaults objectForKey:[NSString stringWithFormat:@"entry%dtime2", i]],
                               [defaults objectForKey:[NSString stringWithFormat:@"entry%dtime3", i]],
                               [defaults objectForKey:[NSString stringWithFormat:@"entry%dtime4", i]],
                               [defaults objectForKey:[NSString stringWithFormat:@"entry%dtime5", i]]];
            [Entry entryOfType:type withHeader:header andPrimary:primary andSecondary:secondary andTimes:times];
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

+ (void)clearData {
    _types =[[NSMutableArray alloc] init];
    _primaryEmail = nil;
    _secondaryEmail = nil;
    _useSecondaryEmail = NO;
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
    if (version == 0) {
        [GlobalData addType:@"Contact"];
        [GlobalData addType:@"Education"];
        [GlobalData addType:@"Employment"];
        [GlobalData addType:@"Research"];
        [GlobalData addType:@"Skills"];
        [GlobalData addType:@"Awards"];
        [GlobalData addType:@"Honors"];
        
        [Entry entryOfType:@"Contact"
                withHeader:@"John Smith"
                andPrimary:@"js738@nyu.edu (513)231-0023"
              andSecondary:@"190 E 3th Street Apt 3, New York NY 10003"
                  andTimes:@[@"", @"Temporary", @"", @"", @"", @""]];
        
        [Entry entryOfType:@"Education"
                withHeader:@"New York University"
                andPrimary:@"Bachelor of Science, Chemistry Major; Bachelor of Arts, Honors Politics Major"
              andSecondary:@"Cummulative GPA 3.8/4.0"
                  andTimes:@[@"", @"September", @"2011", @"", @"May", @"2015"]];
        
        [Entry entryOfType:@"Employment"
                withHeader:@"Brown and Whalen, LLP"
                andPrimary:@"Legal Assistant"
              andSecondary:@"Assisted assosiates in legal research, fact checking, and organization of documents. Prepared, electronically filed and hand delivered motions to New York Supreme Court. Perfromed various administrative tasks such as answering phone calls, copying, filing and scanning documents."
                  andTimes:@[@"", @"January", @"2013", @"", @"", @""]];
        
        [Entry entryOfType:@"Employment"
                withHeader:@"Forensic Panel"
                andPrimary:@"Active Casework Intern"
              andSecondary:@"Responsible for background research on psychology reports, appeals, and witness statements to aid an official expert testimony regarding an active death penalty case. Researched various forensic psychology research articles to form an online database."
                  andTimes:@[@"", @"September", @"2013", @"", @"December", @"2013"]];
        
        [Entry entryOfType:@"Employment"
                withHeader:@"Forensic Panel"
                andPrimary:@"Deprevity Research Intern"
              andSecondary:@"Assisted in research in project to create an objective sentencing tool to define what constitutes a deprave crime under the direction of Dr. Michael Welner. Responsible for marking the presence of deprave acts through research of witness statements, police reports, defendant statements, and autopsy/medical reports of resolved cases."
                  andTimes:@[@"", @"June", @"2013", @"", @"September", @"2013"]];
        
        [Entry entryOfType:@"Research"
                withHeader:@"Kahr Group - New York University Department of Chemistry"
                andPrimary:@"Individual Chemistry Research"
              andSecondary:@"Designed and managed research project in coordination with a graduate student. Observed the effects of changing dye impurities, within achiral crystalline structures, on crystal florescence."
                  andTimes:@[@"", @"June", @"2013", @"", @"August", @"2013"]];
        
        [Entry entryOfType:@"Research"
                withHeader:@"Kahr Group - New York University Department of Chemistry"
                andPrimary:@"Chemistry Research Assistant to Graduate Student"
              andSecondary:@"Placed in charge of data collection and analysis of research disproving the effect of chirality on optically active substances."
                  andTimes:@[@"", @"May", @"2013", @"", @"August", @"2013"]];
        
        [Entry entryOfType:@"Volunteer Work"
                withHeader:@"SHINE Program"
                andPrimary:@"Worked with underprivileged youth in London weekly. Taught Class 4 (9-10 year old children) reading and writing."
              andSecondary:@""
                  andTimes:@[@"", @"February", @"2013", @"", @"May", @"2013"]];
        
        [Entry entryOfType:@"Honors"
                withHeader:@"College of Arts and Science Presidential Honors Scholar"
                andPrimary:@"Selected for program which invites the top five percent of entering class, targeted for students who intend to graduate with honors in their major."
              andSecondary:@""
                  andTimes:@[@"", @"September", @"2011", @"", @"", @""]];
        
        [Entry entryOfType:@"Honors"
                withHeader:@"Julius Silver Scholarship"
                andPrimary:@"Recipient of merit and need based scholarship provided to students who excel in a scientific major."
              andSecondary:@""
                  andTimes:@[@"", @"September", @"2011", @"", @"", @""]];
        
        [Entry entryOfType:@"Honors"
                withHeader:@"Lawyer Alumni Mentoring Program"
                andPrimary:@"Selected based on academic achievement and interest in a legal career to be mentored by Christopher Hughes of Cadwalader, Wickersham & Taft LLP."
              andSecondary:@""
                  andTimes:@[@"", @"November", @"2013", @"", @"", @""]];
        
        [Entry entryOfType:@"Skills"
                withHeader:@"Proficient in French, Microsoft Office Suite, STATA, Database Research, Python Programming"
                andPrimary:@""
              andSecondary:@""
                  andTimes:@[@"", @"", @"", @"", @"", @""]];
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
