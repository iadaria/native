//
//  Person.h
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    float heightInMeters;
    int weightInKilos;
}
@property float heightInMeters;
@property int weightInKilos;
- (float)bodyMassIndex;
- (void)addYourselfToArray:(NSMutableArray *)theArray;
@end

NS_ASSUME_NONNULL_END
