//
//  CarTableViewController.m
//  TableViewTest
//
//  Created by Viacheslav Goroshniuk on 18.09.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "CarTableViewController.h"
#import "Car.h"
#import "CarTableViewCell.h"
#import "AFHTTPSessionManager.h"
#import "CarDetailViewController.h"


@interface CarTableViewController ()


@property (strong, nonatomic) NSMutableArray *cars;

@property (assign, nonatomic) BOOL isLoading;

@end

@implementation CarTableViewController

- (void)viewDidLoad {
    
   
    [super viewDidLoad];
    
    self.cars = [NSMutableArray array];
    self.isLoading = false;
    self.title = @"Cars";
    
    [self loadCars];
    
    UINib *cellNib = [UINib nibWithNibName:@"CarTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get car
    Car *car = [self getCarAtIndexPath:indexPath];
    
    // pass car
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CarDetailViewController  *carDetailViewController = (CarDetailViewController *)[sb instantiateViewControllerWithIdentifier:@"stbID"];
    carDetailViewController.car = car;
    
    // show car
    [self.navigationController pushViewController:carDetailViewController animated:true];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Car *car = [self getCarAtIndexPath:indexPath];
    [cell configureWithCar: car];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

#pragma mark - Navigation

- (Car*) getCarAtIndexPath: (NSIndexPath*) indexPath {
    return self.cars[indexPath.row];
}

- (void)loadCars {
    
    if (self.isLoading) {
        return;
    }
    
    self.isLoading = true;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/plain"]];
    [manager GET:@"https://raw.githubusercontent.com/SlavaWRX/CarsTableView/master/Contents.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray *jsonArray = (NSArray *)responseObject;
        
        
        for (NSDictionary *dic in jsonArray) {
            Car *car = [[Car alloc] initWithDictionary:dic];
            [self.cars addObject:car];
        }
        
        
        [self.tableView reloadData];
        self.isLoading = false;
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error %@", error);
        
    }];
    

    
}

#pragma mark - UIScrollViewDelegate

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
    CGPoint contentOffset = scrollView.contentOffset;
    CGFloat contentHeight = scrollView.contentSize.height;
    if (contentOffset.y + 2 * screenHeight >= contentHeight) {
        [self loadCars];
    }
}




@end

