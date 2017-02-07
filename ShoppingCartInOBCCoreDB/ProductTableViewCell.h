//
//  ProductTableViewCell.h
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 7/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product+CoreDataClass.h"

@interface ProductTableViewCell : UITableViewCell
{
    Product * product;
}

@property (nonatomic, retain) Product *product;

@property (nonatomic, retain) IBOutlet UILabel* proNameLable;

@property (weak, nonatomic) IBOutlet UILabel *proPriceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *proImageView;

@property (weak, nonatomic) IBOutlet UILabel *proQtyLabel;

- (IBAction)stepperDidChange:(id)sender;

@end
