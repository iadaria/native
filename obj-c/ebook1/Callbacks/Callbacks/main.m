//
//  main.m
//  Callbacks
//
//  Created by Якимова Дарья on 29.01.24.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Logger *logger = [[Logger alloc] init];
        
        // listening events
        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zonaChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
        // request - protocols
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchConnection = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
        
        // one emmit - one receiver
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:55.0 target:logger selector:@selector(sayOuch:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
