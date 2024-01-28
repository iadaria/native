//
//  main.m
//  ebook1
//
//  Created by Якимова Дарья on 25.01.24.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            Employee *person = [[Employee alloc] init];
            
            [person setWeightInKilos:90 + i];
            [person setHeightInMeters:1.8 - i/10.0];
            [person setEmplyeeID:i];
            
            [employees addObject:person];
            
            if (i == 0) {
                [executives setObject:person forKey:@"CEO"];
            }
            if (i == 1) {
                [executives setObject:person forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            Asset *asset = [[Asset alloc] init];
            
            // Присваивание метки
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
            
            NSUInteger randomIndex = random() % [employees count];
            // get a random employee
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            // set a resource to the employee
            [randomEmployee addAssetsObject:asset];
            
            [allAssets addObject:asset];
        }
        // sort and show employees
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        
        // delete employee by Id
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets < 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        NSLog(@"executives: %@", executives);
        
        NSLog(@"Giving up ownership of array");
        allAssets = nil;
        employees = nil;
        executives = nil;
    }
    return 0;
}
