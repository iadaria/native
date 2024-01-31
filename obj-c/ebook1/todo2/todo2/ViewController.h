//
//  ViewController.h
//  todo2
//
//  Created by Якимова Дарья on 31.01.24.
//

#import <UIKit/UIKit.h>
NSString *docPath(void);
@interface ViewController : UIViewController
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    UIButton *deleteButton;
    NSMutableArray *tasks;
    NSInteger selectedRow;
    
}
- (void)addTask:(id)sender;
- (void)deleteTask:(id)sender;
@property (strong, nonatomic) UIWindow *window;
@property NSInteger selectedRow;
@end

