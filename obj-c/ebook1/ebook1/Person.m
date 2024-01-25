//
//  Person.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import "Person.h"

@implementation Person

- (void)setHeightInMeters:(float)h {
    heightInMeters = h;
}

- (void)setWeightInKilos:(int)w {
    weightInKilos = w;
}

- (float)bodyMassIndex {
    return weightInKilos / (heightInMeters * heightInMeters);
}

@end
