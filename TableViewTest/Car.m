//
//  Car.m
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithName:(NSString *)aName
                   thumbnail:(NSString *)aThumbnail
                       photo:(NSString *)aPhoto
                 description:(NSString *)aDescription {
    
    self = [super init];
    
    if (self) {
        
        self.name = aName;
        self.thumbnail = aThumbnail;
        self.photo = aPhoto;
        self.desc = aDescription;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [self initWithName:dict[@"name"] thumbnail:dict[@"thumbnail"] photo:dict[@"photo"] description:dict[@"description"]];
    
    return self;
}

- (instancetype)init {
    
    self = [self initWithName:@"Undifined" thumbnail:@"Undifined" photo:@"Undifined" description:@"Undifined"];
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", self.name, self.description];
}

@end

