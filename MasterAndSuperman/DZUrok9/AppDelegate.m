//
//  AppDelegate.m
//  DZUrok9
//
//  Created by iMac on 22.12.14.
//  Copyright (c) 2014 MilNik. All rights reserved.
//

#import "AppDelegate.h"
#import "MNPatient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    MNPatient* patient1 = [[MNPatient alloc] init];
    
    patient1.name = @"Nik";
    patient1.temperatura = 37.8f;
    [patient1 setColorTroat:MNNormal];
    
    MNPatient* patient2 = [[MNPatient alloc] init];
    
    patient2.name = @"Den";
    patient2.temperatura = 38.6f;
    [patient2 setColorTroat:MNRed];
    
    MNPatient* patient3 = [[MNPatient alloc] init];
    
    patient3.name = @"Sam";
    patient3.temperatura = 39.8f;
    [patient3 setColorTroat:MNNormal];
    
    MNPatient* patient4 = [[MNPatient alloc] init];
    
    patient4.name = @"Vova";
    patient4.temperatura = 39.9f;
    [patient4 setColorTroat:MNRed];
    
    MNPatient* patient5 = [[MNPatient alloc] init];
    
    patient5.name = @"Nataly";
    patient5.temperatura = 36.6f;
    [patient5 setColorTroat:MNNormal];
    
    
       // создаем массив пациентов
    NSArray* patientArray = [NSArray arrayWithObjects:
                             patient1,
                             patient2,
                             patient3,
                             patient4,
                             patient5,
                             nil];
    
    
 
    
       /*
    for (MNPatient* patient in patientArray) {
        
        MNPatient* patient = (MNPatient*)patient;
        
        NSLog(@"%@ are you ok?", patient.name);
        [patient whatYouGot:patientFeelsBad(patient)]; // лечит хороший доктор
        NSLog(@"------");
        
    }
    */
    
    void (^patientFeelsBad)(MNPatient*) = ^(MNPatient* patient) {
        
        NSLog(@"Patient %@ feels bad", patient.name); // показывает имя пациента
        
        // если болит горло:
        if (patient.bodyParts == MNTroat) {
            
            
            if (patient.colorTroat) {
                
                if (patient.temperatura <= 38.f) {
                    
                    [patient takePill]; // горло красное и температура ниже 38 - принимаем таблеточку
                    
                } else {
                    
                    [patient makeShot]; // горло красное и температура выше 38 - делаем укол
                }
                
                [patient lubricateTroat]; // так как горло красное - мажем мазью в любом случае
                
            } else {
                
                if (patient.temperatura <= 38.f) {
                    
                    [patient takePill]; // горло не красное, и температура ниже 38 - принимаем таблеточку
                    
                } else {
                    
                    [patient makeShot]; // горло не красное, но температура выше 38 - делаем укол
                }
            }
        }
        // если болит голова
        else if (patient.bodyParts == MNHead) {
            
            
            [patient takePill]; // если болит голова - принимаем таблеточку
            
        }
        // если болит живот
        else if (patient.bodyParts == MNBelly) {
            
            
            if (patient.temperatura <= 37.f) {
                
                [patient takePill]; // если живот болит и температура нормальная - принять пилюлю
                
            } else if (patient.temperatura > 37.f && patient.temperatura < 38.5f){
                
                [patient throwUp]; // если живот болит и температура находиться в пределах 37 - 38.5 надо промыть желудок
                
            } else if (patient.temperatura >= 38.5f) {
                
                [patient gastroScopy]; // если живот болит и температура выше 38.5 - надо сделать гастроскопию
                
            }
        }
        // если болит сердце
        else if (patient.bodyParts == MNHeart) {
            
            
            
            [patient takePill]; // если болит сердце - принять пилюлю
            
            //patient.bodyParts = arc4random()%2 ? MNNothing : MNHeart; // у пациента продолжает болеть сердце или ему легчает
            /*
            if (patient.bodyParts != MNNothing) {
                
                [patient makeShot]; // если пациенту не полегчало - делаем укол
                
            }*/
            
        }
        
        
        
        //[patient setScoreDoctor:arc4random()%2]; // ставит оценку доктору (хорошо или плохо)
    };
    
    
    //[patient1 whatYouGot:patientFeelsBad];
    
    
    for (MNPatient* patient in patientArray) {
        
        patient.bodyParts = arc4random()%4;
        [patient whatYouGot:patientFeelsBad]; // лечит хороший доктор
        NSLog(@"bodyParts = %u",[patient bodyParts]);
        NSLog(@"------");
        
    }
    
    
    
    return YES;
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
