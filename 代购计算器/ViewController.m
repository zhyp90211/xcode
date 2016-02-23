//
//  ViewController.m
//  代购计算器
//
//  Created by ZhangYupeng on 10/6/15.
//  Copyright © 2015 ZhangYupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_profit setSelectedSegmentIndex:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)calculate:(id)sender {
    double price = [[_price text] doubleValue];
    if([_tax isOn])
        price = price * 1.0875;
    double discount1 = [[_Discount1 titleForSegmentAtIndex:([_Discount1 selectedSegmentIndex])] doubleValue]/10;
    double discount2 = [[_Discount2 titleForSegmentAtIndex:([_Discount2 selectedSegmentIndex])] doubleValue]/10;
    price = price * discount1 * discount2;
    
    double weight = [_weightInteger selectedSegmentIndex] + [[_WeightDecimal text] doubleValue]/16;
    int category = [_category selectedSegmentIndex];
    
    switch (category)
    {
        case 0:
            category = 4;
            break;
        case 1:
            category = 5;
            break;
        case 2:
            category = 6;
            break;
        case 3:
            category = 7;
            break;
        case 4:
            category = 12;
            break;
        default:
            category = 4;
    }
    
    double shipping = category * weight;
    
    int profit =[_profit selectedSegmentIndex];
    
    switch (profit)
    {
        case 0:
            profit = 2;
            break;
        case 1:
            profit = 5;
            break;
        case 2:
            profit = 10;
            break;
        case 3:
            profit = 16;
            break;
        case 4:
            profit = 30;
            break;
        case 5:
            profit = 40;
            break;
        default:
            profit = 10;
    }
    
    double result = (price + shipping + profit) *6.8;
      NSString *output = [NSString stringWithFormat:@"%4.2f",result];
       [_result setText:output];
}

- (IBAction)backgroundtap:(id)sender
{
     [self.view endEditing:(true)];
}

@end
