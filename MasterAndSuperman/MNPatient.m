//
//  MNPatient.m
//  DZUrok9
//
//  Created by iMac on 22.12.14.
//  Copyright (c) 2014 MilNik. All rights reserved.
//

#import "MNPatient.h"



@implementation MNPatient




- (void) whatYouGot:(void(^)(MNPatient*)) block{
    
    [self setBodyParts:arc4random()%6]; // определяет, что именно болит у пациента, может вообще ничего не болеть
    
    block(self);
    
}



- (void) takePill {
    
    NSLog(@"Patient %@ takes a pill", self.name);
    
}

- (void) makeShot {
    
    NSLog(@"Patient %@ make shot", self.name);
    
}

- (void) lubricateTroat {
    
    NSLog(@"Patient %@ lubricate the troat", self.name);
    
}

- (void) throwUp {
    
    NSLog(@"Patient %@ throw up", self.name);
    
}

- (void) gastroScopy {
    
    NSLog(@"Patient %@ gastroscopy", self.name);
    
}

@end
