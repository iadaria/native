//
//  Asset.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset
@synthesize label, resaleValue, holder;

- (NSString *)description
{
    if ([self holder]) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@ >", [self label], [self resaleValue], [self holder]];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>", [self label], [self resaleValue]];
    }
}
// При уничтожении объекто отправляется сообщение dealloc
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
