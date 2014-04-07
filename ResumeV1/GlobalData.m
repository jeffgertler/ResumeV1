//
//  GlobalData.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/6/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "GlobalData.h"
#import "Entry.h"

@implementation GlobalData


+(BOOL) addType:(NSString *) newType{
    if(_types == NULL){
        _types =[[NSMutableArray alloc] init];
    }
    for(NSString *type in _types){
        if([type isEqualToString:newType]){
            return NO;
        }
    }
    [_types addObject:newType];
    return YES;
}

+(int) typesSize {
    return [_types count];
}

+(NSString *) getTypeAt:(int)index{
    return [_types objectAtIndex:index];
}

+(void) saveEntries{
    [self resetDefaults];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"yes" forKey:@"isDataSaved"];
    [defaults setObject:[NSString stringWithFormat:@"%d", [Entry entriesSize]] forKey:@"numEntries"];
    for(int i=0; i<[Entry entriesSize]; i++){
        [defaults setObject:[Entry getObjectAt:i].type forKey:[NSString stringWithFormat:@"entry%dtype", i]];
        [defaults setObject:[Entry getObjectAt:i].header forKey:[NSString stringWithFormat:@"entry%dheader", i]];
        [defaults setObject:[Entry getObjectAt:i].primary forKey:[NSString stringWithFormat:@"entry%dprimary", i]];
        [defaults setObject:[Entry getObjectAt:i].secondary forKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
    }
    [defaults synchronize];
}

+(void) loadEntries{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([[defaults objectForKey:@"isDataSaved"] isEqualToString:@"yes"]){
        [Entry clearEntries];
        for(int i=0; i<[[defaults objectForKey:@"numEntries"] intValue]; i++){
            NSString *type = [defaults objectForKey:[NSString stringWithFormat:@"entry%dtype", i]];
            NSString *header = [defaults objectForKey:[NSString stringWithFormat:@"entry%dheader", i]];
            NSString *primary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dprimary", i]];
            NSString *secondary = [defaults objectForKey:[NSString stringWithFormat:@"entry%dsecondary", i]];
            [Entry entryOfType:type withHeader:header andPrimary:primary andSecondary:secondary];
        }
    }
}

+(void) resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

@end
