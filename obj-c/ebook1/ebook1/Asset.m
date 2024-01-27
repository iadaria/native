//
//  Asset.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import "Asset.h"

@implementation Asset
@synthesize label, resaleValue;

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%d >", [self label], [self resaleValue]];
}
// При уничтожении объекто отправляется сообщение dealloc
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
