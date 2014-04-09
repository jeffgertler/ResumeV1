//
//  NetworkComm.m
//  ResumeV1
//
//  Created by George Wong on 4/8/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "NetworkComm.h"

@implementation NetworkComm


+ (NSString *)sendMessage:(NSString *)msg {
    
    
    int sockfd = 0, n = 0;
    char recvBuff[1024];
    
    const char *host = "174.34.170.4";
    host = "127.0.0.1";
    int port = 2001;
    
    struct sockaddr_in serv_addr;

    memset(recvBuff, '0',sizeof(recvBuff));
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        NSLog(@"\n Error : Could not create socket \n");
    }
    
    memset(&serv_addr, '0', sizeof(serv_addr));
    
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(2001);
    
    if(inet_pton(AF_INET, host, &serv_addr.sin_addr)<=0) {
        NSLog(@"\n inet_pton error occured\n");    }
    
    if( connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    {
        NSLog(@"\n Error : Connect Failed \n");
    }
    
    // send
    char sendBuff[1025];
    snprintf(sendBuff, sizeof(sendBuff), "%s\n", (const char *)"REPLY");
    write(sockfd, sendBuff, strlen(sendBuff));
    
    while ( (n = read(sockfd, recvBuff, sizeof(recvBuff)-1)) > 0) {
        recvBuff[n] = 0;
        if (fputs(recvBuff, stdout) == EOF) {
            printf("\n Error : Fputs error\n");
        }
    }
    
    return @"Hello world!";
}


@end
