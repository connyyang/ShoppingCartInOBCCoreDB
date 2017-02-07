//
//  ProductTableViewCell.m
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 7/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"here");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]){
        
        if(product != nil){
            self.proNameLable.text = [NSString stringWithFormat:@"%@",product.product_name];
            self.proPriceLabel.text = [NSString stringWithFormat:@"$%@",product.product_price];
            self.proImageView.image = product.product_img;
            
        }
    }
    
    return self;
}


- (IBAction)stepperDidChange:(id)sender {
}
@end
