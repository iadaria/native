//
//  ViewController.m
//  todo
//
//  Created by Якимова Дарья on 30.01.24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"hello world";
        [label sizeToFit];
        label.center =  CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
        label;
    })];

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
}


@end
