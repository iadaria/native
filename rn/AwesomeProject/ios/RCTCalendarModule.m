#import <React/RCTLog.h>
#import "RCTCalendarModule.h"

@implementation RCTCalendarModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createCalendarEvent:(NSString *)name
                      location:(NSString *)location
                          myCallback:(RCTResponseSenderBlock)callback) {
    //NSLog(@"Pretending to create an event %@ at %@", name, location);
    NSNumber *eventId = [NSNumber numberWithInt:123];

    callback(@[[NSNull null], eventId]);

    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

RCT_EXPORT_METHOD(createCalendarEvent:(NSString *)name
                      location:(NSString *)location
                          errorCallback:(RCTResponseSenderBlock)errorCallback
                              successCallback:(RCTResponseSenderBlock)successCallback) {
    //NSLog(@"Pretending to create an event %@ at %@", name, location);
    @try {
        NSNumber *eventId = [NSNumber numberWithInt:123];
        successCallback(@[eventId]);
    } @catch (NSException *e) {
        errorCallback(@[e]);
    }

    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

RCT_EXPORT_METHOD(createCalendarEvent:(NSString *)name
                      location:(NSString *)location
                          resolver:(RCTPromiseResolveBlock)resolve
                              rejecter:(RCTPromiseRejectBlock)reject) {
    NSInteger eventId = [NSNumber numberWithInt:124];

    if (eventId) {
        resolve(@(eventId));
    } else {
        reject(@"event_failure", @"no event id returned", nil);
    }
}

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(getName) {
    return [[UIDevice currentDevice] name];
}

//- (NSDictionary *)constantsToExport
//{
//    return @{
//        @"DEFAULT_EVENT_NAME": @"New Event"
//    };
//}

@end
