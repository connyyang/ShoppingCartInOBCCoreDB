//
//  ViewController.m
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 2/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

NSManagedObjectContext *managedObjectContext;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // get AppDelegate object
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    // define managedObjectContext object
    managedObjectContext = appDelegate.persistentContainer.viewContext;
    
    //[self createProducts];
    [self fetchProducts];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)fetchProducts{
    NSFetchRequest * fetch = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:fetch error:&error];
    
    if(!results){
        NSLog(@"Fail to fetch data! Error -- %@",[error localizedDescription]);
    }
    else
    {
        NSLog(@"results: %@",results);
    }
    
}

-(void)createProducts{
    NSManagedObject *product1 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:managedObjectContext];
    [product1 setValue:@"APPLEPRO12345" forKey:@"product_id"];
    [product1 setValue:@"Apple TV" forKey:@"product_name"];
    [product1 setValue:[NSNumber numberWithFloat:585] forKey:@"product_price"];
    [product1 setValue:[UIImage imageNamed:@"img_tv"] forKey:@"product_img"];
    
    NSManagedObject *product2 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:managedObjectContext];
    [product2 setValue:@"APPLEPRO12346" forKey:@"product_id"];
    [product2 setValue:@"Apple Watch" forKey:@"product_name"];
    [product2 setValue:[NSNumber numberWithFloat:125] forKey:@"product_price"];
    [product2 setValue:[UIImage imageNamed:@"img_watch"] forKey:@"product_img"];
    
    NSManagedObject *product3 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:managedObjectContext];
    [product3 setValue:@"APPLEPRO12347" forKey:@"product_id"];
    [product3 setValue:@"Apple Ipad" forKey:@"product_name"];
    [product3 setValue:[NSNumber numberWithFloat:320] forKey:@"product_price"];
    [product3 setValue:[UIImage imageNamed:@"img_ipad"] forKey:@"product_img"];
    
    NSError *error;
    if(![managedObjectContext save:&error]){
        NSLog(@"Fail to save! Error: \@",[error localizedDescription]);
    }
}


@end
