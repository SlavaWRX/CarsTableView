//
//  CarTableViewCell.h
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"


@interface CarTableViewCell : UITableViewCell

- (void) configureWithCar:(Car *) car;


@end
