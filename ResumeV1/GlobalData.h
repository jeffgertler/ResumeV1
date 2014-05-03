//
//  GlobalData.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/6/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

static NSMutableArray *_types;
static NSMutableArray *_readyEntries;
static int _templateNumber;
static int _MSG_SIZE = 1020; // 1024 minus safety room
static NSMutableString *_primaryEmail;
static NSMutableString *_secondaryEmail;
static BOOL _useSecondaryEmail;


@interface GlobalData : NSObject

// Resume ready data
@property NSMutableArray *entriesNeedingSecondaries; //ints, indexes
@property NSArray *info; //strings

// Initialization
+(BOOL) addType:(NSString *) newType;
+(int) typesSize;

// Getters
+(NSString *) getTypeAt:(int)index;
+ (int)messageSize;
+ (NSString *)versionNumber;
+ (int)readyEntriesSize;
+ (Entry *)getReadyObjectAt:(int)index;
+ (NSArray *)readyEntriesWithType:(NSString *)type;
+ (int)numReadyEntriesWithType:(NSString *)type;
+ (int)getTemplateNumber;
+ (NSString *)primaryEmail;
+ (NSString *)secondaryEmail;
+ (BOOL)useSecondaryEmail;

// Setters
+ (void)setReadyEntries:(NSMutableArray *)entries;
+ (void)setTemplateNumber:(int)number;
+ (void)setPrimaryEmail:(NSString *)s;
+ (void)setSecondaryEmail:(NSString *)s;
+ (void)setUseSecondaryEmail:(BOOL)use;

// Saving and loading
+(void) saveState;
+(void) loadState;
+(void) resetDefaults;

// Utility methods
+ (NSString *)stringForServer;
+ (void)printReadyEntries;

@end

#define INT2STR(I) ([NSString stringWithFormat:@"%d",I])