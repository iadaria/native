//
//  Asset.h
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import <Foundation/Foundation.h>
@class Employee;
NS_ASSUME_NONNULL_BEGIN

@interface Asset : NSObject
{
    NSString *label;
    __weak Employee *holder;
    unsigned int resaleVAlue;
}
// strong - Это указатель на объект, владельцем которого я стан.
@property (strong) NSString *label;
@property (weak) Employee *holder;
@property unsigned int resaleValue;
@end

NS_ASSUME_NONNULL_END
