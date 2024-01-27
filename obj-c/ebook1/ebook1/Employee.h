//
//  Employee.h
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN
@class Asset;
@interface Employee : Person
{
    int employeeID;
    NSMutableArray *assets;
}
@property int emplyeeID;
- (void) addAssetsObject:(Asset *)a;
- (unsigned int)valueOfAssets;
@end

NS_ASSUME_NONNULL_END
