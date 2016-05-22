//
//  ViewController.m
//  DefaultValueForUnexsitingKeyINJSON
//
//  Created by James Rochabrun on 21-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "CustomCellTableViewCell.h"
#import "Match.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.matches = [NSMutableArray new];
    // Do any additional setup after loading the view, typically from a nib.
    [self getJson];
    NSLog(@"this is the count %lu", self.matches.count);
}

- (void)getJson {
    
    NSString *urlString = @"http://www.resultados-futbol.com/scripts/api/api.php?key=40b2f1fd2a56cbd88df8b2c9b291760f&req=matchs&format=json&tz=America/Chicago&lang=en&league=177&group=all&round=1";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSMutableArray *matchesDataArray = [NSMutableArray new];
        matchesDataArray = dictionary[@"match"];
        [self createMatchesObjects:matchesDataArray];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            [self.tableView reloadData];
        });
    }];
    [task resume];
}

- (void) createMatchesObjects:(NSMutableArray*)arr {
    
    for (NSDictionary *dict in arr) {
        Match *match = [[Match alloc]initWitName:[dict valueForKey:@"local"] visitorName: [dict valueForKey:@"visitor"] local_abbr: [dict valueForKey:@"local_abbr"] unexistingKey:[dict valueForKey:@"unexistingKey"]];
        [self.matches addObject:match];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Match *match =  [self.matches objectAtIndex:indexPath.row];
    cell.teamLabel.text = match.local;
    cell.teamBLabel.text = match.visitor;
    cell.extraLabel.text = [match valueForKey:match.unexistingKey];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.matches.count;
}




@end
