//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE A/S. All rights reserved.
//

#import "DemoViewController.h"
#import "UIView+ClassyLayoutProperties.h"
#import "DemoView.h"
#import "ExampleTableViewController.h"

@interface DemoViewController ()
@property(nonatomic, strong) DemoView *mainView;
@end

@implementation DemoViewController {

}

- (id)init {
	self = [super init];
	if (self) {
		self.title = @"ClassyLiveLayout";
	}
	return self;
}


- (void)loadView {
	[super loadView];
	self.view = self.mainView;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.mainView.tableButton addTarget:self action:@selector(pushTableViewController) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushTableViewController {
	ExampleTableViewController *exampleTableViewController = [ExampleTableViewController new];
	[self.navigationController pushViewController:exampleTableViewController animated:YES];
}


- (DemoView *)mainView {
	if (!_mainView) {
		_mainView = [DemoView new];
		_mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	}
	return _mainView;
}


@end