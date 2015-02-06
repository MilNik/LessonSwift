//
//  MNPatient.h
//  DZUrok9
//
//  Created by iMac on 22.12.14.
//  Copyright (c) 2014 MilNik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum {MNNormal, MNRed} MNColor; // цвет горла пациента (нормальное, красное)

typedef enum {MNHead, MNTroat, MNBelly, MNHeart} MNSickBody; // больные части тела: MNHead - голова, MNTroat - горло, MNBelly - живот, MNHeart - сердце, MNNothing - ничего не болит

@interface MNPatient : NSObject

@property (strong, nonatomic) NSString* name; // имя пациента
@property (assign, nonatomic) CGFloat temperatura; // температура
@property (assign, nonatomic) MNColor colorTroat; // цвет горла
@property (assign, nonatomic) MNSickBody bodyParts; // части тела, которые могут болеть или ничего не болит


- (void) whatYouGot:(void(^)(MNPatient*)) block; // что у вас болит?



- (void) takePill; // принять пилюлю
- (void) makeShot; // сделать укол
- (void) lubricateTroat; // смазать горло
- (void) throwUp; // промыть желудок (стошнить)
- (void) gastroScopy; // провести гастроскопию



@end
