//
//  CarTableViewCell.m
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "CarTableViewCell.h"

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
    //self.carImageView.image =
    
    
}

@end
