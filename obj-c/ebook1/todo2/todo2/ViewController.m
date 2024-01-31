//
//  ViewController.m
//  todo2
//
//  Created by Якимова Дарья on 31.01.24.
//

#import "ViewController.h"
NSString *docPath(void) {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.td"];
}
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        tasks = [plist mutableCopy];
    } else {
        tasks = [[NSMutableArray alloc] init];
    }
    // init a few tasks
    if ([tasks count] == 0) {
        [tasks addObject:@"Walk the dogs"];
        [tasks addObject:@"Feed the hogs"];
        [tasks addObject:@"Chop the logs"];
        [tasks addObject:@"6 pomodoro obj-c"];
        [tasks addObject:@"6 pomodoro android-java"];
    }
    
    /*UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];*/
    
    CGRect tableFrame = CGRectMake(0, 120, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 80, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 80, 72, 31);
    
    taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [taskTable setDataSource:self];
    
    // Field
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    // Insert button
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    [[self view] addSubview:taskTable];
    [[self view] addSubview:taskField];
    [[self view] addSubview:insertButton];
    
}


- (void)addTask:(id)sender {
    NSLog(@"Clicked sender %@", sender);
    NSString *t = [taskField text];
    if ([t isEqualToString:@""]) {
        return;
    }
    [tasks addObject:t];
    [taskTable reloadData];
    [taskField setText:@""];
    [taskField resignFirstResponder];
    
    
}

#pragma mark - Table View managemnt
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!c) {
        c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        NSString *item = [tasks objectAtIndex: [indexPath row]];
        [[c textLabel] setText:item];
    }
    return c;
}

@end
