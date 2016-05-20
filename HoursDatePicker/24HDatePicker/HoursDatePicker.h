//
//  HoursDatePicker.h
//  HoursDatePicker
//
//  Created by Alex on 16/5/20.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedDateBlcok)(NSString *selectedDate);

@interface HoursDatePicker : UIView

@property (copy, nonatomic) SelectedDateBlcok selectedDateBlock;

+ (instancetype)sharedHoursDateView;

@end
