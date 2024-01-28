//
//  Blender.h
//  Constants
//
//  Created by Якимова Дарья on 28.01.24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    BlenderSpeedStir = 1,
    BlenderSpeedChop = 2,
    BlenderSpeedLiquify = 5,
    BlenderSpeedPulse = 9,
    BlenderSpeedIceCrush = 15
} BlenderSpeed2;

// the same
typedef enum {
    BlenderSpeedStir1,
    BlenderSpeedChop2,
    BlenderSpeedLiquify3,
    BlenderSpeedPulse4,
    BlenderSpeedIceCrush5
} BlenderSpeed3;

enum BlenderSpeed {
    Stir = 1,
    Chop = 2,
    Liquify = 5,
    Pulse = 9,
    IceCrush = 15
};

@interface Blender : NSObject
{
    enum BlenderSpeed speed;
    BlenderSpeed2 speed2;
}
- (void)setSpeed:(enum BlenderSpeed)x;
- (void)setSpeed2:(BlenderSpeed2)x;
@end

NS_ASSUME_NONNULL_END
