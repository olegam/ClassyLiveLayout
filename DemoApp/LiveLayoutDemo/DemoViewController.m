//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE A/S. All rights reserved.
//

#import "DemoViewController.h"
#import "UIView+ClassyLayoutProperties.h"

@interface DemoViewController ()

@property(nonatomic, strong) UIView *blueBoxView;
@property(nonatomic, strong) UIView *redBoxView;

@end

@implementation DemoViewController {

}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self addViews];
	[self.view setNeedsUpdateConstraints];
}

- (void)addViews {
	[self.view addSubview:self.blueBoxView];
	[self.view addSubview:self.redBoxView];
}

- (void)updateViewConstraints {
	[super updateViewConstraints];

	// new shorthand notation
	[_blueBoxView mas_updateConstraintsWidthFromStylesheet];
	[_blueBoxView mas_updateConstraintsHeightFromStylesheet];
	[_blueBoxView mas_updateConstraintsWithTopMarginRelativeTo:self.view];
	[_blueBoxView mas_updateConstraintsWithLeftMarginRelativeTo:self.view];


	// traditional Masonry notationmain
	[_redBoxView mas_updateConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(@(_redBoxView.cas_size.width));
		make.height.equalTo(_blueBoxView);
		make.top.equalTo(_blueBoxView);
		make.left.equalTo(_blueBoxView.mas_right).with.offset(_redBoxView.cas_margin.left);
	}];
}

- (UIView *)blueBoxView {
	if (!_blueBoxView) {
		_blueBoxView = [UIView new];
		_blueBoxView.backgroundColor = [UIColor blueColor];
		_blueBoxView.cas_styleClass = @"blue-box";
	}
	return _blueBoxView;
}

- (UIView *)redBoxView {
	if (!_redBoxView) {
		_redBoxView = [UIView new];
		_redBoxView.backgroundColor = [UIColor redColor];
		_redBoxView.cas_styleClass = @"red-box";
	}
	return _redBoxView;
}


@end