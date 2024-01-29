//
//  Logger.m
//  Callbacks
//
//  Created by Якимова Дарья on 29.01.24.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(nonnull NSTimer *)t {
    NSLog(@"Ouch!");
}
// вызывается при каждом получении блока данных
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    [incomingData appendData:data];
}
// вызывается при обработке последнего блока
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
    //NSLog(@"The whole string is %@", string);
}
// вызывается в случае ошибки при загрузке данных
- (void)connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed!");
}

@end
