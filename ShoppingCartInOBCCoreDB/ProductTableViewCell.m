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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    if(self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]){
//        
//        if(self.product != nil){
//            NSLog(@"CELL3");
//            self.proNameLable.text = [NSString stringWithFormat:@"%@",self.product.product_name];
//            self.proPriceLabel.text = [NSString stringWithFormat:@"$%@",self.product.product_price];
//            self.proImageView.image = self.product.product_img;
//            
//        }
//    }
//    
//    return self;
//}


- (IBAction)stepperDidChange:(UIStepper *)sender {
    self.proQtyLabel.text = [NSString stringWithFormat:@"%02i",(int)[sender value]];
}
@end
