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

@property (strong, nonatomic)NSArray *cars;

@end

@implementation CarTableViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.title = @"Cars";
    
    [self loadCars];
    
    UINib *cellNib = [UINib nibWithNibName:@"CarTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CarDetailViewController  *vc = (CarDetailViewController *)[sb instantiateViewControllerWithIdentifier:@"stbID"];
    
    [self.navigationController pushViewController:vc animated:true];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell configureWithCar: self.cars[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

#pragma mark - Navigation

- (void)loadCars {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/plain"]];
    
    [manager GET:@"https://raw.githubusercontent.com/SlavaWRX/CarsTableView/master/Contents.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray *jsonArray = (NSArray *)responseObject;
        NSMutableArray *tempCars = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in jsonArray) {
            Car *car = [[Car alloc] initWithDictionary:dic];
            [tempCars addObject:car];
        }
        
        self.cars = [[NSArray alloc] initWithArray:tempCars];
        tempCars = nil;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error %@", error);
        
    }];
    
}

@end

