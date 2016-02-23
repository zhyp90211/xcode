//
//  ViewController.h
//  代购计算器
//
//  Created by ZhangYupeng on 10/6/15.
//  Copyright © 2015 ZhangYupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *price;

@property (weak, nonatomic) IBOutlet UISwitch *tax;

@property (weak, nonatomic) IBOutlet UISegmentedControl *weightInteger;

@property (weak, nonatomic) IBOutlet UITextField *WeightDecimal;

@property (weak, nonatomic) IBOutlet UISegmentedControl *category;

@property (weak, nonatomic) IBOutlet UISegmentedControl *profit;

@property (weak, nonatomic) IBOutlet UISegmentedControl *Discount1;

@property (weak, nonatomic) IBOutlet UISegmentedControl *Discount2;

@property (weak, nonatomic) IBOutlet UITextField *result;

- (IBAction)calculate:(id)sender;


- (IBAction)backgroundtap:(id)sender;

@end

