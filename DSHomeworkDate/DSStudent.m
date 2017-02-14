//
//  DSStudent.m
//  DSHomeworkDate
//
//  Created by Дмитрий Солоп on 03.02.17.
//  Copyright © 2017 Dimon Solop. All rights reserved.
//

#import "DSStudent.h"

@interface DSStudent ()

@property (strong, nonatomic) NSArray* arrayBaseOfName;
@property (strong, nonatomic) NSArray* arrayBaseOfLastName;

@end

@implementation DSStudent

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.arrayBaseOfName = [NSArray arrayWithObjects:
                                @"Михаил", @"Николай", @"Дмитрий", @"Роман", @"Василий",
                                @"Алексей", @"Максим", @"Евгений", @"Владимир", @"Андрей",@"Олег", @"Елисей",
                                @"Александр", @"Илья", @"Тимофей", @"Матвей", @"Семен", @"Денис", @"Данила",
                                @"Григорий", @"Руслан", @"Тимур", @"Юрий", @"Георгий", @"Давид",@"Ольга", @"Елена",
                                @"Алена", @"Татьяна", @"Авдотья", @"Вераника", @"Галина", @"Ксения", @"Алла",
                                @"Виола", @"Влада", @"Богдана", @"Валерия", @"Варвара", @"Дана", @"Джамиля",
                                @"Жасмин", @"Диана", @"Екатерина", @"Жозефина", @"Илона", @"Ирма", @"Кристина",
                                @"Клара", @"Лилия", nil];
        
        self.arrayBaseOfLastName = [NSArray arrayWithObjects:
                                    @"Солоп", @"Данченко", @"Клюйко", @"Запорожченко", @"Петренко", @"Андреенко",
                                    @"Руденко", @"Полищук", @"Бондарь", @"Бондаренко",@"Бондарчук", @"Захаренко",
                                    @"Захарченко", @"Юшко", @"Клименко", @"Макаренко", @"Макарченко", @"Чикотило",
                                    @"Махно", @"Николенко", @"Никольченко", @"Гончар", @"Гончаренко", @"Гончарук",
                                    @"Кравец", @"Кравченко", @"Кравчук", @"Гоголь", @"Горобец", @"Комар",
                                    @"Шевченко", @"Белоштан", @"Хрущ", @"Хрущов", @"Лещенко", @"Кобзон",
                                    @"Кривонос", @"Рябоконь", @"Подопригора", @"Вырвихвост", @"Непийвода",
                                    @"Миняйло", @"Колесниченко", @"Коваль", @"Коваленко", @"Ковальчук", @"Весна",
                                    @"Шумейко", @"Кличко", @"Марочко", nil];
        
        self.name = [self.arrayBaseOfName objectAtIndex:arc4random() % [self.arrayBaseOfName count]];
        self.lastName = [self.arrayBaseOfLastName objectAtIndex:arc4random() % [self.arrayBaseOfLastName count]];
        self.dateOfBirth = [NSDate dateWithTimeInterval:arc4random_uniform(1604764986) % 1204764986 sinceDate:[NSDate dateWithTimeIntervalSinceNow:-1604764986]];
    }
    return self;
}


@end
