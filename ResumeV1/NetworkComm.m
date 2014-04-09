//
//  NetworkComm.m
//  ResumeV1
//
//  Created by George Wong on 4/8/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import "NetworkComm.h"

@implementation NetworkComm

// So this isn't the best way to do it, but
// it should save from some memory problems
// and "no connection" errors.

+ (NSString *)sendMessage:(NSString *)msg {
    
    int LOG_LEVEL = 0;
    int messageSize = [GlobalData messageSize];
    
    const char *host = "174.34.170.4";
    int port = 2001;
    
    int sockfd = 0, n = 0;
    char recvBuff[1024];
    char sendBuff[1024];
    char tmp[1024];
    struct sockaddr_in serv_addr;
    
    MEMCLR(recvBuff);
    MEMCLR(sendBuff);
    memset(&serv_addr, '0', sizeof(serv_addr));
    
    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        NSLog(@"ERR: could not create socket");
        return @"ERR_SOCK";
    }
    
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(port);
    
    if (inet_pton(AF_INET, host, &serv_addr.sin_addr)<=0) {
        NSLog(@"ERR: inet_pton error occured");
        return @"ERR_PTON";
    }
    
    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        NSLog(@"ERR: connect failed");
        return @"ERR_CONN";
    }
    
    // FIGURE OUT THE SIZE
    int bytesize = [msg length];   // in # of bytes
    int size = 1;
    while (bytesize > messageSize) {
        size++;
        bytesize -= messageSize;
    }
 
    // HELO
    MEMCLR(tmp);
    sprintf(tmp,"HELO V %s",[[GlobalData versionNumber] cStringUsingEncoding:NSASCIIStringEncoding]);
    FORMAT_SEND(tmp);
    DO_SEND;
    
    // HELO RECV
    DO_READ;
    recvBuff[n++] = '\n';
    if (LOG_LEVEL) FORMAT_PRINT;
    
    // SIZE
    MEMCLR(tmp);
    sprintf(tmp,"SIZE %d",size);
    FORMAT_SEND(tmp);
    DO_SEND;
    
    // MESSAGE LOOP
    for (int i=0; i<size; i++) {
        // RECV
        DO_READ;
        recvBuff[n++] = '\n';
        if (LOG_LEVEL) FORMAT_PRINT;
        
        // Format msg
        NSString *msg_ss = [msg substringWithRange:NSMakeRange(i*messageSize,[msg length]>(i+1)*messageSize?messageSize:([msg length]-(i*messageSize)))];
        
        // SEND
        MEMCLR(tmp);
        sprintf(tmp,"%s",[msg_ss cStringUsingEncoding:NSASCIIStringEncoding]);
        FORMAT_SEND(tmp);
        DO_SEND;
    }
    
    // FINAL RECV ADDR
    DO_READ;
    recvBuff[n++] = '\n';
    if (LOG_LEVEL) FORMAT_PRINT;
    
    // Clean everything up
    close(sockfd);
    
    return [NSString stringWithFormat:@"%s", recvBuff];
}

@end


/*
 
 Protocol Definition
 
 In order to ensure successful communication with the server, we define
 the following protocol for messages. Two leftwards chevrons (<<) denote
 a message SENT to the server; two rightwards chevrons (>>) denote the
 response message RECEIVED from the server.
 
 << HELO V [A.B]
 >> ACK GO [A.B]
 << SIZE [SIZE]
 >> ACK GO [1]
 << [MSG 1]
 >> ACK GO [2]
 << [MSG 2]
 ...
 >> ACK GO [n]
 << [MSG n]
 >> RECV [addr]
 
 [A.B]   -- version number
 [SIZE]  -- number of parts
 [n]     -- part number
 [addr]  -- address where pdf will be posted
 
 */

