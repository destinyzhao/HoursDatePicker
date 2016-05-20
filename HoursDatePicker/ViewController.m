//
//  ViewController.m
//  HoursDatePicker
//
//  Created by Alex on 16/5/20.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "HoursDatePicker.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (strong, nonatomic) HoursDatePicker *hDatePicker;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showDatePicker:(id)sender {
    
    [self showDatePicker];
}

- (void)showDatePicker
{
    __weak __typeof(&*self)weakSelf = self;
    
    _hDatePicker = [HoursDatePicker sharedHoursDateView];
    _hDatePicker.frame =  self.view.bounds;
    [self.view addSubview:_hDatePicker];
    
    self.hDatePicker.selectedDateBlock = ^(NSString *selectedDate){
        weakSelf.timeLbl.text = selectedDate;
        weakSelf.hDatePicker = nil;
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
