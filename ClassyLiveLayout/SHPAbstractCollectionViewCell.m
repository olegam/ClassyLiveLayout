//
//  Created by Ole Gammelgaard Poulsen on 13/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import "SHPAbstractCollectionViewCell.h"
#import "UIView+ClassyLayoutProperties.h"

@implementation SHPAbstractCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self addSubviews];
		[UIView recursivelyUpdateStylingImmediately:self];
		[self defineLayout];
	}
	return self;
}

- (void)updateConstraints {
	[self defineLayout];
	[super updateConstraints];
}

- (void)addSubviews {
	NSAssert(NO, @"Must override");
}

- (void)defineLayout {
	NSAssert(NO, @"Must override");
}

@end