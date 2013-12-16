//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE A/S. All rights reserved.
//

#import "DemoViewController.h"
#import "UIView+ClassyLayoutProperties.h"

@interface DemoViewController ()

@property(nonatomic, strong) UIView *boxView;

@end

@implementation DemoViewController {

}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self addViews];
	[self.view setNeedsUpdateConstraints];
}

- (void)addViews {
	[self.view addSubview:self.boxView];
}

- (void)updateViewConstraints {
	[super updateViewConstraints];

	[_boxView mas_updateConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(@(_boxView.cas_size.width));
		make.height.equalTo(@(_boxView.cas_size.height));
		make.top.equalTo(@(_boxView.cas_margin.top));
		make.left.equalTo(@(_boxView.cas_margin.left));
	}];
}

- (UIView *)boxView {
	if (!_boxView) {
		_boxView = [UIView new];
		_boxView.backgroundColor = [UIColor blueColor];
		_boxView.cas_styleClass = @"my-box";
	}
	return _boxView;
}


@end