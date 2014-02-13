//
//  Created by Ole Gammelgaard Poulsen on 13/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "ExampleTableViewCell.h"

@interface ExampleTableViewController ()

@end

@implementation ExampleTableViewController {

}

- (id)init {
	self = [super init];
	if (self) {
		self.title = @"Table View example";
	}
	return self;
}


- (void)viewDidLoad {
	[super viewDidLoad];

	[self.tableView registerClass:[ExampleTableViewCell class] forCellReuseIdentifier:@"_"];
}

- (void)updateViewConstraints {
	[super updateViewConstraints];

	[self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [ExampleTableViewCell cellHeightFromStylesheet];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	ExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"_" forIndexPath:indexPath];
	cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
	return cell;
}


@end