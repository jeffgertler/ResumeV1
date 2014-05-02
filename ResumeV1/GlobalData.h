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


@interface GlobalData : NSObject

// Initialization
+(BOOL) addType:(NSString *) newType;
+(int) typesSize;

// Getters and Setters
+(NSString *) getTypeAt:(int)index;
+ (int)messageSize;
+ (NSString *)versionNumber;
+ (void)setReadyEntries:(NSMutableArray *)entries;
+ (int)readyEntriesSize;
+ (Entry *)getReadyObjectAt:(int)index;
+ (NSArray *)readyEntriesWithType:(NSString *)type;
+ (int)numReadyEntriesWithType:(NSString *)type;
+ (void)setTemplateNumber:(int)number;
+ (int)getTemplateNumber;
+ (void)setPrimaryEmail:(NSString *)s;
+ (void)setSecondaryEmail:(NSString *)s;
+ (NSString *)primaryEmail;
+ (NSString *)secondaryEmail;

// Saving and loading
+(void) saveEntries;
+(void) loadEntries;
+(void) resetDefaults;

// Resume ready data
@property NSMutableArray *entriesNeedingSecondaries; //ints, indexes
@property NSArray *info; //strings

// Utility methods
+ (NSString *) stringForServer;
+ (void)printReadyEntries;

@end

#define INT2STR(I) ([NSString stringWithFormat:@"%d",I])