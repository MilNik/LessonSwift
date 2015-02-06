//
//  MNDoctor.h
//  DZUrok9
//
//  Created by iMac on 23.12.14.
//  Copyright (c) 2014 MilNik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNPatient.h"



@interface MNDoctor : NSObject //<MNPatientDelegate>

@property (assign, nonatomic) NSInteger headCount; // колличество хворых на голову
@property (assign, nonatomic) NSInteger troatCount; // колличество хворых на горло
@property (assign, nonatomic) NSInteger bellyCount; // колличество хворых на живот
@property (assign, nonatomic) NSInteger heartCount; // колличество хворых на сердце
@property (assign, nonatomic) NSInteger nothingCount; // колличество здоровых

@property (strong, nonatomic) NSString* nameDoctor;


- (void) doctorRaport; // метод создающий рапотр за день

@end
