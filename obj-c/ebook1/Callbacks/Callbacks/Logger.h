//
//  Logger.h
//  Callbacks
//
//  Created by Якимова Дарья on 29.01.24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Logger : NSObject
{
    NSMutableData *incomingData;
}
- (void)sayOuch:(NSTimer *)t;
- (void)zonaChange:(NSNotification *)note;
@end

NS_ASSUME_NONNULL_END
