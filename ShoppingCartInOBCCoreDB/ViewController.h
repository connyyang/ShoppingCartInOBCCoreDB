//
//  ViewController.h
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 2/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product+CoreDataClass.h"


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray<Product *> *products;
}

@property (nonatomic, retain) NSMutableArray<Product *> *products;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

