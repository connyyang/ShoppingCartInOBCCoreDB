//
//  ViewController.m
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 2/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Product+CoreDataClass.h"
#import "ProductTableViewCell.h"

NSManagedObjectContext *managedObjectContext;

@interface ViewController ()

@end

NSMutableDictionary * shoppingCart;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // get AppDelegate object
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    // define managedObjectContext object
    managedObjectContext = appDelegate.persistentContainer.viewContext;
    
    // declare products NSMutableArray
    self.products = [[NSMutableArray<Product *> alloc]init];
    
    // init shoppingcart
    shoppingCart = [[NSMutableDictionary alloc]init];
    
   // [self.tableView registerClass:[ProductTableViewCell class] forCellReuseIdentifier:@"ProductCell"];
    
    //[self.tableView registerNib:[UINib nibWithNibName:@"ProductTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProductCell"];
    
    // init tableview
    //self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // add delegate
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    CGFloat rowHeight = 120;
    [self.tableView setRowHeight:rowHeight];
    
    
    //[self createProducts];
    [self fetchProducts];
    
    //[self.view addSubview:self.tableView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)fetchProducts{
    NSFetchRequest * fetch = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
    
    // This is where condition
    //NSPredicate * predict = [NSPredicate predicateWithFormat:@"product_id","Apple12345"];
    //[fetch setPredicate:predict];
    
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:fetch error:&error];
    
    if(!results){
        NSLog(@"Fail to fetch data! Error -- %@",[error localizedDescription]);
    }
    else
    {
        NSLog(@"result: %@",results);
        for(NSManagedObject *result in results)
        {
            NSLog(@"result: %@",results);
            Product * product = result;
           
            [self.products addObject:product];
            
            NSLog(@"products : %@", self.products);
        }
        //products = (NSArray<Product *>)results;
        //NSLog(@"results: %@",results);
    }
    
    NSLog(@"products number: %i",(long)[self.products count]);
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.products count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * productCell = @"ProductCell";
    
    ProductTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:productCell];
    
    
    if(cell == nil){
        cell = (ProductTableViewCell*)[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:productCell];
        
        NSLog(@"Cell is nil");
    }
    Product * product = [self.products objectAtIndex:indexPath.row];
    cell.product = product;
    
    NSLog(@"ITS LABEL dd:%@",product.product_img);

    
    cell.proNameLable.text = [NSString stringWithFormat:@"%@",product.product_name];
    cell.proPriceLabel.text = [NSString stringWithFormat:@"$%i",(int)product.product_price];
    cell.proImageView.image = (UIImage *)product.product_img;
   // cell.imageView.image = [UIImage imageNamed:@"img_ipad.png"];
    
    return cell;
    

//    static NSString * productCell = @"ProductCell";
//    UITableViewCell * cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:productCell];
//    
//    if(cell == nil){
//        cell = (UITableViewCell*)[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:productCell];
//        
//    }
//    //cell.product = [self.products objectAtIndex:indexPath.row];
//    Product * product = [self.products objectAtIndex:indexPath.row];
//    cell.textLabel.text = product.product_name;
//    NSLog(@"product");
//    return cell;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140.0;
}

@end
