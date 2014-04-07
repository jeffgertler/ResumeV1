//
//  GlobalData.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/6/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSMutableArray *_types;

@interface GlobalData : NSObject

+(BOOL) addType:(NSString *) newType;
+(int) typesSize;
+(NSString *) getTypeAt:(int)index;

+(void) saveEntries;
+(void) loadEntries;
+(void)resetDefaults;

@end
