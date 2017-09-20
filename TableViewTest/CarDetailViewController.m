//
//  CarDetailViewController.m
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "CarDetailViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface CarDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *desc;

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}


- (void) configureWithCar:(Car *) car {

    
    self.title = [self.car name];
    
    [self.photo sd_setImageWithURL:[NSURL URLWithString:car.photo]
                  placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    
    self.desc.text = car.desc;

    
    
}

@end

