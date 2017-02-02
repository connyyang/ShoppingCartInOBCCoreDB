//
//  AppDelegate.h
//  ShoppingCartInOBCCoreDB
//
//  Created by Conny Yang on 2/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

