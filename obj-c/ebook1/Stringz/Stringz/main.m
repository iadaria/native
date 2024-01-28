//
//  main.m
//  Stringz
//
//  Created by Якимова Дарья on 28.01.24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //writing
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Daria is cool!\n"];
        }
        
        NSError *error = nil;
        // &error - передаем адрес указателя - те это **error
        BOOL success = [str writeToFile:@"/too/darned/bad.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (success) {
            NSLog(@"done writing/tmp/cool.txt");
        } else {
            NSLog(@"writing/tmp/cool.txt failed: %@", [error localizedDescription]);
        }
        
        //reading
        error = nil;
        NSString *str2 = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSASCIIStringEncoding error:&error];
        
        if (!str2) {
            NSLog(@"read failed: %@", [error localizedDescription]);
        } else{
            NSLog(@"resolv.conf looks like this: %@", str);
        }
    }
    return 0;
}
