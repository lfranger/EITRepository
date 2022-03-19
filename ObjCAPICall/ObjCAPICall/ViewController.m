//
//  ViewController.m
//  ObjCAPICall
//
//  Created by Consultant on 3/18/22.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self fetchBrewery];
}

- (void) fetchBrewery{
    
    NSString *urlString = @"https://api.openbrewerydb.org/breweries";
    NSURL *url = [NSURL URLWithString: urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        //NSString *dummyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"Dummy string: %@", dummyString);
        
        NSError *err;
        NSArray *breweriesJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            if(err){
                NSLog(@"Failed to serialize into JSON: %@", err);
                return;
            }
            
        NSMutableArray<Brewery *> *brews = NSMutableArray.new;
            for(NSDictionary *breweryDict in breweriesJSON){
                
                NSString *name = breweryDict[@"name"];
                NSString *type = breweryDict[@"brewery_type"];
                NSString *city = breweryDict[@"city"];
                NSString *state = breweryDict[@"state"];
                
                Brewery *brewery = Brewery.new;
                brewery.name = name;
                brewery.type = type;
                brewery.city = city;
                brewery.state = state;
                
                [brews addObject:brewery];
            }
          
        self->_breweries = brews;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        //NSLog(@"%@", brews);
        
        }] resume];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _breweries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"cell"];
    }
    
    cell.textLabel.text = _breweries[indexPath.row].name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", _breweries[indexPath.row].city, _breweries[indexPath.row].state];
    
    return cell;
}


@end
