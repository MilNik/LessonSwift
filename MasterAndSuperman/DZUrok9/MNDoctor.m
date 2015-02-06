//
//  MNDoctor.m
//  DZUrok9
//
//  Created by iMac on 23.12.14.
//  Copyright (c) 2014 MilNik. All rights reserved.
//

#import "MNDoctor.h"

@implementation MNDoctor


// инициализируем переменные (колличество больных) начальными значениями (0) во время инициализации экземпляра класса MNDoctor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headCount = 0;
        self.troatCount = 0;
        self.bellyCount = 0;
        self.heartCount = 0;
        self.nothingCount = 0;
    }
    return self;
}



#pragma mark - MNPatientDelegate

- (void) patientFeelsBad:(MNPatient*) patient {
    
    NSLog(@"Patient %@ feels bad", patient.name);
    
    if (patient.temperatura >= 37.f && patient.temperatura <= 39.5f) {
        [patient takePill]; // если температура от 37 до 39.5 - принять таблетку
        
        if (patient.colorTroat) {
            [patient lubricateTroat]; // если горло красное - помазать его лекарством
        }
        
    } else if (patient.temperatura > 39.5f) {
        [patient makeShot]; // если температура выше 39.5 - сделать укол
        
        if (patient.colorTroat) {
            [patient lubricateTroat]; // если горло красное - помазать его лекарством
        }
        
    } else {
        NSLog(@"Patient %@ should rest", patient.name); // если температура ниже 37 - просто надо отдохнуть
    }
    
    
    
}


// наш хороший доктор
- (void) patientFeelsBadGoodDoktor:(MNPatient*) patient {
    
    NSLog(@"Patient %@ feels bad. Doctor name = %@", patient.name, self.nameDoctor); // показывает имя пациента и имя лечащего врача
    
    // если болит горло:
    if (patient.bodyParts == MNTroat) {
        
        self.troatCount++; // добавляем единицу к счетчику больных на горло

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
        
        self.headCount++; // добавляем единицу к счетчику больных на голову
        
        [patient takePill]; // если болит голова - принимаем таблеточку
        
    }
    // если болит живот
    else if (patient.bodyParts == MNBelly) {
        
        self.bellyCount++; // добавляем единицу к счетчику больных на живот
        
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
        
        self.heartCount++; // добавляем единицу к счетчику больных на сердце
        
        [patient takePill]; // если болит сердце - принять пилюлю
        
        patient.bodyParts = arc4random()%2 ? MNNothing : MNHeart; // у пациента продолжает болеть сердце или ему легчает
        
        if (patient.bodyParts != MNNothing) {
            
            [patient makeShot]; // если пациенту не полегчало - делаем укол
            
        }
        
    }
    
    else {
        
        self.nothingCount++; // добавляем единицу к счетчику здоровых пациентов
        
    }
    
    [patient setScoreDoctor:arc4random()%2]; // ставит оценку доктору (хорошо или плохо)
    
}


- (void) doctorRaport {
    
    NSLog(@"Head - %ld, troat - %ld, belly - %ld, heart - %ld, not bad - %ld",
          [self headCount],
          [self troatCount],
          [self bellyCount],
          [self heartCount],
          [self nothingCount]);
    
}


@end
