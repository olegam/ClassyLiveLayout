//
//  Created by Ole Gammelgaard Poulsen on 24/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import "SHPAbstractScrollView.h"
#import "UIView+ClassyLayoutProperties.h"

@implementation SHPAbstractScrollView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self addSubviews];
		[UIView recursivelyUpdateStylingImmediately:self];
		[self defineLayout];
	}
	return self;
}

- (id)init {
	return [self initWithFrame:CGRectZero];
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