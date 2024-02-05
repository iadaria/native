//
//  Appliance.m
//  Appliances
//
//  Created by Якимова Дарья on 05.02.24.
//

#import "Appliance.h"

@implementation Appliance
@synthesize productName, voltage;
- (id)init {
    return [self initWithProductName:@"Unknown"];
}

- (nonnull id)initWithProductName:(nonnull NSString *)pn {
    self = [super init];
    // Метод вернул значение, отличное от nil?
    if (self) {
        [self setProductName:pn];
        [self setVoltage:120];
    }
    return self;
}
- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@: %d volts", productName, voltage];
}
@end
