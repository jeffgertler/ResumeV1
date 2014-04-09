//
//  NetworkComm.h
//  ResumeV1
//
//  Created by George Wong on 4/8/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h>

#import <Foundation/Foundation.h>

@interface NetworkComm : NSObject

+ (NSString *)sendMessage:(NSString *)msg;


@end
