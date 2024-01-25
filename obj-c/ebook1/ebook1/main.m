//
//  main.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *person = [[Person alloc] init];
        [person setWeightInKilos:65];
        [person setHeightInMeters:173];
        
        float bmi = [person bodyMassIndex];
        NSLog(@"person has a BMI of %f", bmi);
    }
    return 0;
}
