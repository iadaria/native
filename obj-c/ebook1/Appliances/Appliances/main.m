//
//  main.m
//  Appliances
//
//  Created by Якимова Дарья on 05.02.24.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Appliance *appliance = [[Appliance alloc] initWithProductName:@"Table"];

        NSLog(@"Name: %@, voltage: %d", [appliance productName], [appliance voltage]);
        
        Appliance *a = [[Appliance alloc] init];
        NSLog(@"a is %@", a);
        [a setProductName:@"Washing Machine"];
        [a setVoltage:240];
        NSLog(@"a is %@", a);
    }
    return 0;
}
