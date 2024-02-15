//
//  main.m
//  VowelMovement
//
//  Created by Якимова Дарья on 10.02.24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        __block int counter = 0;
        void (^counterBlock)() = ^{ counter++; };
        counterBlock();
        counterBlock();
        
        NSArray *oldStrings = [NSArray arrayWithObjects:@"Daria", @"Alex", @"Olya", nil];
        
        NSLog(@"old strings: %@", oldStrings);
        NSMutableArray *newStrings = [NSMutableArray array];
        NSArray *vowels = [NSArray arrayWithObjects:@"a", @"e", @"i", @"o", @"u", nil];
        
        
        
        [oldStrings enumerateObjectsUsingBlock:^(id string, NSUInteger i, BOOL *stop) {
            NSRange yRange = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];
            if (yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
                
            }
            [newStrings addObject:newString];
        }];
        NSLog(@"new strings: %@", newStrings);
    }
    return 0;
}
