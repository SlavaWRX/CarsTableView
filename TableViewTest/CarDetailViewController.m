//
//  CarDetailViewController.m
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *desc;

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [self.car name];
    [self.photo setImageWithURL:[NSURL URLWithString:self.car.photo]
               placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    self.desc.text = self.car.desc;
}

@end

