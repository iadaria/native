//
//  NSString+VowelCounting.m
//  VowelCounter
//
//  Created by Якимова Дарья on 10.02.24.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCounting.h"

@implementation NSString (VowelCounting)

- (int)vowelCount
{
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeioyuAeioi"];
    NSUInteger count = [self length];
    int sum = 0;
    for (int i = 0; i < count; i++) {
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c]) {
            sum++;
        }
    }
    return sum;
}

@end
