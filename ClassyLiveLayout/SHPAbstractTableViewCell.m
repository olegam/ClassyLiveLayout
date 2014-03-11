//
//  Created by Ole Gammelgaard Poulsen on 13/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import "UIView+ClassyLayoutProperties.h"
#import "Classy.h"
#import "SHPAbstractTableViewCell.h"

@implementation SHPAbstractTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
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