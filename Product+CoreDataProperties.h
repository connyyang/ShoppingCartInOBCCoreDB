//
//  Product+CoreDataProperties.h
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 7/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "Product+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *product_id;
@property (nullable, nonatomic, retain) NSObject *product_img;
@property (nullable, nonatomic, copy) NSString *product_name;
@property (nonatomic) float product_price;

@end

NS_ASSUME_NONNULL_END
