//
//  main.m
//  VowelCounter
//
//  Created by Якимова Дарья on 05.02.24.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Hello, World!";
        NSLog(@"%@ has %d vowels", string, [string vowelCount]);
    }
    return 0;
}
