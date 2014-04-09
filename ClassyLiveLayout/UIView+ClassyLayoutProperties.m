//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE A/S. All rights reserved.
//

#import <objc/runtime.h>
#import <Masonry/MASLayoutConstraint.h>
#import "Classy.h"
#import "UIView+ClassyLayoutProperties.h"
#import "View+MASAdditions.h"


@implementation UIView (ClassyLayoutProperties)

+ (void)recursivelyUpdateStylingImmediately:(UIView *)view {
	[CASStyler.defaultStyler styleItem:view];
	[view.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
		[self recursivelyUpdateStylingImmediately:subview];
	}];
}

+ (void)load {
	[super load];

	CASObjectClassDescriptor *objectClassDescriptor = [[CASStyler defaultStyler] objectClassDescriptorForClass:UIView.class];
	objectClassDescriptor.propertyKeyAliases = @{
			@"size"			: @cas_propertykey(UIView, cas_size),
			@"sizeWidth"	: @cas_propertykey(UIView, cas_sizeWidth),
			@"sizeHeight"	: @cas_propertykey(UIView, cas_sizeHeight),
			@"margin"		: @cas_propertykey(UIView, cas_margin),
			@"marginTop"	: @cas_propertykey(UIView, cas_marginTop),
			@"marginLeft"	: @cas_propertykey(UIView, cas_marginLeft),
			@"marginBottom"	: @cas_propertykey(UIView, cas_marginBottom),
			@"marginRight"	: @cas_propertykey(UIView, cas_marginRight),
	};
}


- (void)updateSuperviewsConstraints {
	// Only trigger reloading of constraints when debugging to not hurt performance
#ifdef TARGET_IPHONE_SIMULATOR
	UIView *view = self.superview;
	while (view) {
		[view setNeedsUpdateConstraints];
		view = view.superview;
	}
#endif
}

- (UIEdgeInsets)cas_margin {
	return [(NSValue *) objc_getAssociatedObject(self, @selector(cas_margin)) UIEdgeInsetsValue];
}

- (void)setCas_margin:(UIEdgeInsets)cas_margin {
	[self willChangeValueForKey:@"cas_margin"];
	[self willChangeValueForKey:@"cas_marginTop"];
	[self willChangeValueForKey:@"cas_marginLeft"];
	[self willChangeValueForKey:@"cas_marginBottom"];
	[self willChangeValueForKey:@"cas_marginRight"];

	NSValue *value = [NSValue valueWithUIEdgeInsets:cas_margin];
	objc_setAssociatedObject(self, @selector(cas_margin), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

	[self didChangeValueForKey:@"cas_margin"];
	[self didChangeValueForKey:@"cas_marginTop"];
	[self didChangeValueForKey:@"cas_marginLeft"];
	[self didChangeValueForKey:@"cas_marginBottom"];
	[self didChangeValueForKey:@"cas_marginRight"];

	[self updateSuperviewsConstraints];
}

- (CGSize)cas_size {
	return [(NSValue *) objc_getAssociatedObject(self, @selector(cas_size)) CGSizeValue];
}

- (void)setCas_size:(CGSize)cas_size {
	[self willChangeValueForKey:@"cas_size"];
	[self willChangeValueForKey:@"cas_sizeWidth"];
	[self willChangeValueForKey:@"cas_sizeHeight"];

	NSValue *value = [NSValue valueWithCGSize:cas_size];
	objc_setAssociatedObject(self, @selector(cas_size), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

	[self didChangeValueForKey:@"cas_size"];
	[self didChangeValueForKey:@"cas_sizeWidth"];
	[self didChangeValueForKey:@"cas_sizeHeight"];

	[self updateSuperviewsConstraints];
}

#pragma mark - Shorthands

- (CGFloat)cas_sizeWidth {
	return self.cas_size.width;
}

- (void)setCas_sizeWidth:(CGFloat)cas_sizeWidth {
	CGSize currentSize = self.cas_size;
	currentSize.width = cas_sizeWidth;
	self.cas_size = currentSize;
}

- (CGFloat)cas_sizeHeight {
	return self.cas_size.height;
}

- (void)setCas_sizeHeight:(CGFloat)cas_sizeHeight {
	CGSize currentSize = self.cas_size;
	currentSize.height = cas_sizeHeight;
	self.cas_size = currentSize;
}

- (CGFloat)cas_marginTop {
	return self.cas_margin.top;
}

- (void)setCas_marginTop:(CGFloat)cas_marginTop {
	UIEdgeInsets currentMargin = self.cas_margin;
	currentMargin.top = cas_marginTop;
	self.cas_margin = currentMargin;
}

- (CGFloat)cas_marginLeft {
	return self.cas_margin.left;
}

- (void)setCas_marginLeft:(CGFloat)cas_marginLeft {
	UIEdgeInsets currentMargin = self.cas_margin;
	currentMargin.left = cas_marginLeft;
	self.cas_margin = currentMargin;
}

- (CGFloat)cas_marginBottom {
	return self.cas_margin.bottom;
}

- (void)setCas_marginBottom:(CGFloat)cas_marginBottom {
	UIEdgeInsets currentMargin = self.cas_margin;
	currentMargin.bottom = cas_marginBottom;
	self.cas_margin = currentMargin;
}

- (CGFloat)cas_marginRight {
	return self.cas_margin.right;
}

- (void)setCas_marginRight:(CGFloat)cas_marginRight {
	UIEdgeInsets currentMargin = self.cas_margin;
	currentMargin.right = cas_marginRight;
	self.cas_margin = currentMargin;
}

#pragma mark - Masonry shortcuts

- (NSArray *)mas_updateConstraintsWithTopMarginRelativeToSuperview {
	return [self mas_updateConstraintsWithTopMarginRelativeTo:self.superview];
}

- (NSArray *)mas_updateConstraintsWithLeftMarginRelativeToSuperview {
	return [self mas_updateConstraintsWithLeftMarginRelativeTo:self.superview];
}

- (NSArray *)mas_updateConstraintsWithBottomMarginRelativeToSuperview {
	return [self mas_updateConstraintsWithBottomMarginRelativeTo:self.superview];
}

- (NSArray *)mas_updateConstraintsWithRightMarginRelativeToSuperview {
	return [self mas_updateConstraintsWithRightMarginRelativeTo:self.superview];
}



- (NSArray *)mas_updateConstraintsWithTopMarginRelativeTo:(id)attribute {
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(attribute).with.offset(self.cas_marginTop);
	}];
}

- (NSArray *)mas_updateConstraintsWithLeftMarginRelativeTo:(id)attribute {
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(attribute).with.offset(self.cas_marginLeft);
	}];
}

- (NSArray *)mas_updateConstraintsWithBottomMarginRelativeTo:(id)attribute {
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(attribute).with.offset(- self.cas_marginBottom);
	}];
}

- (NSArray *)mas_updateConstraintsWithRightMarginRelativeTo:(id)attribute {
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(attribute).with.offset(- self.cas_marginRight);
	}];
}

- (NSArray *)mas_updateConstraintsHeightFromStylesheet {
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.height.equalTo(@(self.cas_sizeHeight));
	}];
}

- (NSArray *)mas_updateConstraintsWidthFromStylesheet {
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(@(self.cas_sizeWidth));
	}];
}

- (NSArray *)mas_updateConstraintsCenterX {
	NSAssert(self.superview, @"Must have a superview already when calling this");
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.superview);
	}];
}

- (NSArray *)mas_updateConstraintsCenterY {
	NSAssert(self.superview, @"Must have a superview already when calling this");
	return [self mas_updateConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self.superview);
	}];
}


+ (CGSize)sizeFromStylesheet {
	// because creating a new dummy view and loading its size from stylesheet is expensive we cache it
	NSValue *cachedSizeValue = objc_getAssociatedObject(self, @selector(sizeFromStylesheet));
	BOOL useCachedSize = cachedSizeValue != nil;
#if TARGET_IPHONE_SIMULATOR
	// never cache in simulator because we want live reload and don't care about performance
	useCachedSize = NO;
#endif
	if (useCachedSize) {
		return [cachedSizeValue CGSizeValue];
	} else {
		UIView *dummyView = [[self alloc] initWithFrame:CGRectZero];
		[CASStyler.defaultStyler styleItem:dummyView];
		CGSize size = dummyView.cas_size;
		objc_setAssociatedObject(self, @selector(sizeFromStylesheet), [NSValue valueWithCGSize:size], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		return size;
	}
}



@end