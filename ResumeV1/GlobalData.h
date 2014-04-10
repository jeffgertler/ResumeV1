//
//  GlobalData.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/6/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSMutableArray *_types;
static int _MSG_SIZE = 1020; // 1024 minus safety room

@interface GlobalData : NSObject

// Initialization
+(BOOL) addType:(NSString *) newType;
+(int) typesSize;

// Getters
+(NSString *) getTypeAt:(int)index;

// Saving and loading
+(void) saveEntries;
+(void) loadEntries;
+(void)resetDefaults;

@end

#define INT2STR(I) ([NSString stringWithFormat:@"%d",I])
