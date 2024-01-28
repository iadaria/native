//
//  Person.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import "Person.h"

@implementation Person
@synthesize heightInMeters, weightInKilos;

- (float)bodyMassIndex {
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

- (void)addYourselfToArray:(NSMutableArray *)theArray
{
    [theArray addObject:self];
}

@end
