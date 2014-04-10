//
//  NetworkComm.h
//  ResumeV1
//
//  Created by George Wong on 4/8/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
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
#import "GlobalData.h"

@interface NetworkComm : NSObject

+ (NSString *)sendMessage:(NSString *)msg;

@end

#define FORMAT_SEND(M) (snprintf(sendBuff,sizeof(sendBuff),"%s\n",(const char *)M))
#define DO_SEND (write(sockfd,sendBuff,strlen(sendBuff)))
#define DO_READ (n=read(sockfd,recvBuff,sizeof(recvBuff)-1))
#define FORMAT_PRINT (fwrite(recvBuff,sizeof(char),n,stdout))
#define MEMCLR(V) memset(&V,'\0',sizeof(V));


