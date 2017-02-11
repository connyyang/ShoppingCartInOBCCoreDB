//
//  CheckoutViewController.h
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 11/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ViewController.h"

@interface CheckoutViewController : ViewController{
    NSMutableDictionary * shoppingCart;
}

@property (nonatomic, retain) NSMutableDictionary * shoppingCart;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end
