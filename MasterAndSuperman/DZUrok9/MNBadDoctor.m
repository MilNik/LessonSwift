//
//  MNBadDoctor.m
//  DZUrok9
//
//  Created by iMac on 23.12.14.
//  Copyright (c) 2014 MilNik. All rights reserved.
//

#import "MNBadDoctor.h"

@implementation MNBadDoctor

#pragma mark - MNPatientDelegate

- (void) patientFeelsBad:(MNPatient*) patient {
    
    if (patient.temperatura > 40.f) {
        [patient takePill]; // если температура выше 40 - принимаем таблеточку
        
        if (patient.colorTroat) {
            [patient makeShot]; // если горло красное - делаем укол
        }
        
    } else if (patient.temperatura > 37.f && patient.temperatura < 40.f) {
        [patient lubricateTroat]; // если температура от 37 до 40 - мажем горло
    } else {
        NSLog(@"Patient %@ should rest", patient.name); // если температура ниже 37 - просто надо отдохнуть
    }
    
}

@end
