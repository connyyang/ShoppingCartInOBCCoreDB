//
//  CheckoutViewController.m
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 11/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    float total = 0.0;
    if(self.shoppingCart != nil && [self.shoppingCart count] > 0)
    {
        for(id key in self.shoppingCart)
        {
            NSArray * valueArray = [self.shoppingCart objectForKey:key];
            NSLog(@"nsarray : %@",valueArray);
            Product * pro = [valueArray objectAtIndex:0];
            NSNumber * qty = [valueArray objectAtIndex:1];
            int qtyInt = [qty integerValue];
            float price = pro.product_price;
            NSLog(@"price and qty : %f %i",price,qtyInt);
            total += (price * qtyInt);
        }
        
    }
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.02f",total];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
