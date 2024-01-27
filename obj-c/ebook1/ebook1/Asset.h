//
//  Asset.h
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Asset : NSObject
{
    NSString *label;
    unsigned int resaleVAlue;
}
// strong - Это указатель на объект, владельцем которого я стан.
@property (strong) NSString *label;
@property unsigned int resaleValue;
@end

NS_ASSUME_NONNULL_END
