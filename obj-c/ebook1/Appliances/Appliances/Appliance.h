//
//  Appliance.h
//  Appliances
//
//  Created by Якимова Дарья on 05.02.24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Appliance : NSObject {
    NSString *productName;
    int voltage;
}
@property (copy) NSString *productName;
@property int voltage;

- (id)initWithProductName:(NSString *)pn;
@end

NS_ASSUME_NONNULL_END
