//
//  HoursDatePicker.m
//  HoursDatePicker
//
//  Created by Alex on 16/5/20.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "HoursDatePicker.h"

@interface HoursDatePicker ()


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation HoursDatePicker


- (void)awakeFromNib
{
    [self setUp];
}

+ (instancetype)sharedHoursDateView
{
    HoursDatePicker *view = [[[NSBundle mainBundle] loadNibNamed:@"HoursDatePicker" owner:self options:nil] firstObject];
    return view;
}

/**
 *  初始化
 */
- (void)setUp
{
    self.datePicker.datePickerMode = UIDatePickerModeTime;
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [self addGestureRecognizer:tapGesture];
    
}

/**
 *  点击手势
 *
 *  @param gesture 手势
 */
- (void)viewTap:(UIGestureRecognizer *)gesture
{
    [self dismiss];
}

/**
 *  隐藏View
 */
- (void)dismiss
{
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

- (IBAction)cancelBtnClicked:(id)sender {
    [self dismiss];
}

- (IBAction)confirmBtnClicked:(id)sender {
    
    if (self.selectedDateBlock != nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        self.selectedDateBlock([dateFormatter stringFromDate:_datePicker.date]);
        
        [self dismiss];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
