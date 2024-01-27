//
//  Employee.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import "Employee.h"
#import "Asset.h"

@implementation Employee
@synthesize emplyeeID;

- (void)addAssetsObject:(nonnull Asset *)a {
    if (!assets) {
        assets = [[NSMutableArray alloc] init];
    }
    [assets addObject:a];
}

- (unsigned int)valueOfAssets {
    unsigned int sum = 0;
    for (Asset *a in assets) {
        sum += [a resaleValue];
    }
    return sum;
}

- (float)bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %d: $%d in assets>", [self emplyeeID], [self valueOfAssets]];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
