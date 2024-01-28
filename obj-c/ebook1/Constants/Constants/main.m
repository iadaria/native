//
//  main.m
//  Constants
//
//  Created by Якимова Дарья on 28.01.24.
//

#import <Foundation/Foundation.h>

#define MIN2(A,B) ((A) < (B) ? (A) : (B))

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\u03c0 is %f", M_PI);
        NSLog(@"%d is larger", MAX(10, 12));
        NSLog(@"%d is less", MIN2(10, 12));
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
        NSLog(@"Money is %@", currency);
    }
    return 0;
}
