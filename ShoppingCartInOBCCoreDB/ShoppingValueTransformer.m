//
//  ShoppingValueTransformer.m
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 2/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ShoppingValueTransformer.h"
#import <UIKit/UIKit.h>

@implementation ShoppingValueTransformer

+(Class)transformedValueClass{
    return [NSData class];
}

-(id)transformedValue:(id)value{
    if(!value){
        return nil;
    }
    
    if([value isKindOfClass:[NSData class]])
    {
        return value;
    }
    
    return UIImagePNGRepresentation(value);
}

-(id)reverseTransformedValue:(id)value{
    return [UIImage imageWithData:value];
}

@end
