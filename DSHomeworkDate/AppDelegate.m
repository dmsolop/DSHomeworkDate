//
//  AppDelegate.m
//  DSHomeworkDate
//
//  Created by Дмитрий Солоп on 03.02.17.
//  Copyright © 2017 Dimon Solop. All rights reserved.
//

#import "AppDelegate.h"
#import "DSStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSMutableArray* arrayOfStudents = [NSMutableArray array];
    
    for (int i = 0; i < 30; i++) {
        [arrayOfStudents addObject:[DSStudent new]];
    }
    
/*    for (DSStudent* student in arrayOfStudents) {
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd.MM.yyyy"];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:NSCalendarUnitYear
                                                   fromDate:student.dateOfBirth
                                                     toDate:[NSDate date]
                                                    options:0];

        NSLog(@"Student %@ %@ born %@, %@", student.name, student.lastName, [dateFormatter stringFromDate:student.dateOfBirth], components);
    }
    
    NSLog(@"------------------------------------------------------------------------------------\n\n");
 
    NSArray* sortedArray = [arrayOfStudents sortedArrayUsingComparator:^(DSStudent* obj1, DSStudent* obj2) {
        return [obj2.dateOfBirth compare:obj1.dateOfBirth];
    }];
    
    for (DSStudent* student in sortedArray) {
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd.MM.yyyy"];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:NSCalendarUnitYear
                                                   fromDate:student.dateOfBirth
                                                     toDate:[NSDate date]
                                                    options:0];

        NSLog(@"Student %@ %@ born %@, %@", student.name, student.lastName, [dateFormatter stringFromDate:student.dateOfBirth], components);
    } */
    
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    NSDate* minDateOfBirth = [NSDate dateWithTimeIntervalSince1970:0];
    NSDate* maxDateOfBirth = [NSDate date];
    for (DSStudent* stud in arrayOfStudents) {
        maxDateOfBirth = [maxDateOfBirth earlierDate:stud.dateOfBirth];
        minDateOfBirth = [minDateOfBirth laterDate:stud.dateOfBirth];
    }
    
    NSLog(@"\nMinimum date of birth in array %@,\nMaximum date of birth in array %@",
          [dateFormatter stringFromDate:minDateOfBirth], [dateFormatter stringFromDate:maxDateOfBirth]);
    
    NSDate* dateStartTimer = [maxDateOfBirth dateByAddingTimeInterval:-86400];

    /*
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(timerOfStart:)
                                   userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                             changeDateBlock(), @"changeDateBlock",
                                             arrayOfStudents, @"arrayOfStudents",
                                             dateFormatter, @"dateFormatter", nil]
                                    repeats:YES];
     */
    
    SEL selector = @selector(timerOfStart:inDate:inArray:formatDate:);

    NSMethodSignature* signature = [AppDelegate instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:0.5 invocation:invocation repeats:YES];

    [invocation setSelector:selector];
    [invocation setTarget:self];
    [invocation setArgument:&timer atIndex:2];
    [invocation setArgument:&dateStartTimer atIndex:3];
    [invocation setArgument:&arrayOfStudents atIndex:4];
    [invocation setArgument:&dateFormatter atIndex:5];
    
    timer;
    
    
    return YES;
}

- (void) timerOfStart:(NSTimer*) timer inDate:(NSDate*) date inArray:(NSArray*) array formatDate:(NSDateFormatter*) format{
    
    for (DSStudent* student in array){
        if ([student.dateOfBirth isEqualToDate:date]) {
            NSLog(@"Today %@ is the birthday of %@ %@",
                  [format stringFromDate:student.dateOfBirth],
                  student.name,
                  student.lastName);
        }
    }
    
    date = [date dateByAddingTimeInterval:86400];
    int i = 0;
    i++;
    NSLog(@"%d", i);
    //[self matchingDates:blockTemp withFormat:dateFormatterTemp inTheArray:arrayTemp];
}
/*
- (void) matchingDates:(NSBlockOperation*) block withFormat:(NSDateFormatter*) formatOfDate inTheArray:(NSArray*) array {
   // NSDate* dateTemp2 = [NSDate dateWithTimeInterval:86400 sinceDate:date];
    for (DSStudent* student in array){
        if ([student.dateOfBirth isEqualToDate:dateTemp2]) {
            NSLog(@"Today %@ is the birthday of %@ %@",
                  [formatOfDate stringFromDate:student.dateOfBirth],
                  student.name,
                  student.lastName);
        }
    }
    date = dateTemp2;
}*/



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
