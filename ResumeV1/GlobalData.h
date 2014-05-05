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
static NSMutableArray *_entriesNeedingSecondaries; //ints, indexes in readyEntries
static int _templateNumber;
static int _MSG_SIZE = 1020; // 1024 minus safety room
static NSMutableString *_primaryEmail;
static NSMutableString *_secondaryEmail;
static BOOL _useSecondaryEmail;

static NSArray *_specialTypes;
static NSDictionary *_specialTypeOverrides;
static NSArray *_typesNeedingSecondaries;


@interface GlobalData : NSObject

@property NSArray *info; //strings

// Initialization
+ (BOOL)addType:(NSString *) newType;
+ (int)typesSize;
+ (void)setDefaultTypes;

// Getters
+ (NSString *)getTypeAt:(int)index;
+ (int)messageSize;
+ (NSString *)versionNumber;
+ (int)readyEntriesSize;
+ (Entry *)getReadyObjectAt:(int)index;
+ (NSArray *)readyEntriesWithType:(NSString *)type;
+ (int)numReadyEntriesWithType:(NSString *)type;
+ (NSMutableArray *)getReadyEntries;
+ (int)getTemplateNumber;
+ (NSString *)primaryEmail;
+ (NSString *)secondaryEmail;
+ (BOOL)useSecondaryEmail;
+ (NSArray *)specialTypes;
+ (NSDictionary *)specialTypeOverrides;

// Setters
+ (void)setReadyEntries:(NSMutableArray *)entries;
+ (void)setTemplateNumber:(int)number;
+ (void)setPrimaryEmail:(NSString *)s;
+ (void)setSecondaryEmail:(NSString *)s;
+ (void)setUseSecondaryEmail:(BOOL)use;
+ (void)setEntriesNeedingSecondaries:(NSMutableArray *)entries;

// Saving and loading
+ (void)saveState;
+ (void)loadState;
+ (void)resetDefaults;
+ (void)makeSample:(int)version;
+ (void)clearData;

// Utility methods
+ (NSString *)stringForServer;
+ (void)printReadyEntries;

@end

#define INT2STR(I) ([NSString stringWithFormat:@"%d",I])
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define Blue1 Rgb2UIColor(48, 175, 255)
#define Blue2 Rgb2UIColor(49, 174, 222)