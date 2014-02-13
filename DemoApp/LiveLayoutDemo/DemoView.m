//
//  Created by Ole Gammelgaard Poulsen on 13/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import "DemoView.h"

@interface DemoView ()

@end

@implementation DemoView


- (void)addSubviews {
	[self addSubview:self.blueBoxView];
	[self addSubview:self.redBoxView];
	[self addSubview:self.tableButton];
}

- (void)defineLayout {
	// new shorthand notation to create constrains relative to the superview with constants from stylesheet
	[_blueBoxView mas_updateConstraintsWidthFromStylesheet];
	[_blueBoxView mas_updateConstraintsHeightFromStylesheet];
	[_blueBoxView mas_updateConstraintsWithTopMarginRelativeToSuperview];
	// or we can specify another view to set margins relative to:
	[_blueBoxView mas_updateConstraintsWithLeftMarginRelativeTo:self];


	// traditional Masonry notation may be useful in advanced cases
	[_redBoxView mas_updateConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(@(_redBoxView.cas_size.width));
		make.height.equalTo(_blueBoxView);
		make.top.equalTo(_blueBoxView);
		make.left.equalTo(_blueBoxView.mas_right).with.offset(_redBoxView.cas_margin.left);
	}];

	[_tableButton mas_updateConstraintsWithTopMarginRelativeTo:_blueBoxView];
	[_tableButton mas_updateConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(_tableButton.superview);
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

- (UIButton *)tableButton {
	if (!_tableButton) {
		_tableButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		_tableButton.cas_styleClass = @"table-button";
		[_tableButton setTitle:@"TableView example" forState:UIControlStateNormal];
	}
	return _tableButton;
}


@end