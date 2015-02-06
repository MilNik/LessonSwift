//
//  AppDelegate.m
//  DZUrok12
//
//  Created by iMac on 12.01.15.
//  Copyright (c) 2015 MilNik. All rights reserved.
//

#import "AppDelegate.h"
#import "MNStudent.h"


typedef  void (^AppDelegateBlock)(void);

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"-------");
    NSLog(@"Uchenik");
    NSLog(@"-------");
    
    void (^myBlock)(void) = ^{
        NSLog(@"My block is run");
    };
    
    myBlock();
    
    NSString* myString = @"myBlockString";
    
    void (^myBlockString)(NSString*) = ^(NSString* str) {
        NSLog(@"Block %@ is run",str);
    };
    
    myBlockString(myString);
    
    AppDelegateBlock appDelegateBlock = ^{
        NSLog(@"Block appDelegateBlock is run");
    };
    
    [self metodWidhtBlock:appDelegateBlock];
    
    NSLog(@"-------");
    NSLog(@"Student");
    NSLog(@"-------");
    
    
    MNStudent* stud1 = [[MNStudent alloc] init];
    MNStudent* stud2 = [[MNStudent alloc] init];
    MNStudent* stud3 = [[MNStudent alloc] init];
    MNStudent* stud4 = [[MNStudent alloc] init];
    MNStudent* stud5 = [[MNStudent alloc] init];
    MNStudent* stud6 = [[MNStudent alloc] init];
    MNStudent* stud7 = [[MNStudent alloc] init];
    MNStudent* stud8 = [[MNStudent alloc] init];
    MNStudent* stud9 = [[MNStudent alloc] init];
    MNStudent* stud10 = [[MNStudent alloc] init];
    
    stud1.name = @"Nik";
    stud1.lastName = @"Milko";
    
    stud2.name = @"Nata";
    stud2.lastName = @"Milko";
    
    stud3.name = @"Anastasia";
    stud3.lastName = @"Milko";
    
    stud3.name = @"Den";
    stud3.lastName = @"Milko";
    
    stud4.name = @"Sava";
    stud4.lastName = @"Milko";
    
    stud5.name = @"Kate";
    stud5.lastName = @"Milko";
    
    stud6.name = @"Koss";
    stud6.lastName = @"Konovalenko";
    
    stud7.name = @"Tanja";
    stud7.lastName = @"Ivanskaja";
    
    stud8.name = @"Vetal";
    stud8.lastName = @"Potenko";
    
    stud9.name = @"Senja";
    stud9.lastName = @"Senickij";
    
    stud10.name = @"Ivan";
    stud10.lastName = @"FuckOFF";
    
    
    NSMutableArray* studArray = [NSMutableArray arrayWithObjects:
                          stud1,
                          stud2,
                          stud3,
                          stud4,
                          stud5,
                          stud6,
                          stud7,
                          stud8,
                          stud9,
                          stud10,
                          nil]; // массив объектов подряд
    
    for (MNStudent* obj in studArray) {
        NSLog(@"%@ %@", obj.name, obj.lastName);
    }
    
    
/*
    
        NSMutableArray* studentRandomArray = [[NSMutableArray alloc] init]; // cоздаем массив для разбросанных объектов
    
        NSInteger countArray = arc4random()%[studArray count]; // щетчик первого элемента будущего массива (задается случайным образом)
        NSInteger inCount = arc4random()%[studArray count]; // внутренний счетчик
        NSInteger cicleOut = [studArray count];

        for (int i = 0; i < cicleOut; i++) {
            while (countArray == inCount) {
                inCount = arc4random()%[studArray count];
            }
            [studentRandomArray addObject:[studArray objectAtIndex:inCount]];
            [studArray removeObject:[studArray objectAtIndex:inCount]];
            countArray = inCount;
                
        }
    
    
    
  */
    
    
    NSLog(@"---------");
    
    /*
    
    NSMutableArray* myNewArray = [self randomArray:studArray];

    for (MNStudent* obj in myNewArray) {
        NSLog(@"%@ %@", obj.name, obj.lastName);
    }
    
     */
    
   
    NSMutableArray* proba = [[NSMutableArray alloc] init];
    
    proba = [self metodRandomArray:studArray];
    
    for (MNStudent* st in proba) {
        
        NSLog(@"name = %@, last name = %@", st.name, st.lastName);
        
    }
    
    NSLog(@"---------");
    
    NSArray* myArrayStudent = [NSArray arrayWithArray:proba];
    
    myArrayStudent = [proba sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 lastName] == [obj2 lastName]) {
            return [[obj1 name] compare:[obj2 name]];
        } else {
            return [[obj1 lastName] compare:[obj2 lastName]];
        }
    }];
    
    
    for (MNStudent* st in myArrayStudent) {
        
        NSLog(@"name = %@, last name = %@", st.name, st.lastName);
        
    }
    
    
    
    
     
    return YES;
}

- (void) metodWidhtBlock:(AppDelegateBlock) block {
    block();
}


- (NSMutableArray*) metodRandomArray:(NSMutableArray *)otherArray {
    NSMutableArray* myArray = [[NSMutableArray alloc] init]; // массив, который будет возвращаться
    NSMutableArray* arrayCount = [[NSMutableArray alloc] init]; // массив значений
    
    for (int i = 0 ; i < [otherArray count]; i++) {
        [arrayCount addObject:[NSNumber numberWithInt:i]]; // добавление в массив значений (колличество соответствует размеру передаваемого массива)
        }
    
    NSInteger countInArray = [otherArray count];
    
    for (int i = 0 ; i < [otherArray count]; i++) {
        NSInteger myCount = arc4random()%countInArray; // счетчик массива счетчиков))
        NSInteger count = [[arrayCount objectAtIndex:myCount] integerValue]; // значение, извлеченное из массива значений по счетчику
        [myArray addObject:[otherArray objectAtIndex:count]]; // добавление объекта из массива, который передается в метод.
        [arrayCount removeObjectAtIndex:myCount]; // удаление ячейки с уже использованным значением из массива значений
        countInArray --;
    }
    return myArray; // возвращение готового массива
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
