//
//  OwnedAppliance.h
//  Appliances
//
//  Created by Якимова Дарья on 05.02.24.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface OwnedAppliance : Appliance
{
    NSMutableSet *ownerNames;
}
- (id)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n;
- (void)addOwnerNamesObject:(NSString *)n;
- (void)removeOwnerNamesObject:(NSString *)n;
@end

NS_ASSUME_NONNULL_END
