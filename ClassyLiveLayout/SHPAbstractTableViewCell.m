//
//  Created by Ole Gammelgaard Poulsen on 13/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+ClassyLayoutProperties.h"
#import "Classy.h"
#import "SHPAbstractTableViewCell.h"

@implementation SHPAbstractTableViewCell

+ (CGFloat)cellHeightFromStylesheet {
	// because creating a new dummy cell and loading its height from stylesheet is expensive we cache it
	NSNumber *cachedHeightNum = objc_getAssociatedObject(self, @selector(cellHeightFromStylesheet));
	BOOL useCachedHeight = cachedHeightNum != nil;
#if TARGET_IPHONE_SIMULATOR
	// never cache in simulator because we want live reload and don't care about performance
	useCachedHeight = NO;
#endif
	if (useCachedHeight) {
		return [cachedHeightNum floatValue];
	} else {
		SHPAbstractTableViewCell *dummyCell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"_"];
		[dummyCell cas_updateStyling];
		CGFloat height = dummyCell.cas_sizeHeight;
		objc_setAssociatedObject(self, @selector(cellHeightFromStylesheet), @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		return height;
	}
}

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