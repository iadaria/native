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
    NSMutableArray *tasks;
}
- (void)addTask:(id)sender;
@property (strong, nonatomic) UIWindow *window;
@end

