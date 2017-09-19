//
//  CarTableViewCell.m
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "CarTableViewCell.h"
#import "Car.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CarTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *carImageView;

@property (weak, nonatomic) IBOutlet UILabel *carLabel;

@end

@implementation CarTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) configureWithCar:(Car *) car {
    
    
    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:car.thumbnail]];
    
    self.carLabel.text = car.name;
    
    
}

@end
