//
//  OwnedAppliance.m
//  Appliances
//
//  Created by Якимова Дарья on 05.02.24.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance

- (nonnull id)initWithProductName:(nonnull NSString *)pn firstOwnerName:(nonnull NSString *)n {
    self = [super initWithProductName:pn];
    if (self) {
        ownerNames = [[NSMutableSet alloc] init];
        if (n) {
            [ownerNames addObject:n];
        }
    }
    return self;
}

- (id)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:nil];
}

- (void)addOwnerNamesObject:(nonnull NSString *)n {
    [ownerNames addObject:n];
}

- (void)removeOwnerNamesObject:(nonnull NSString *)n {
    [ownerNames removeObject:n];
}



@end
