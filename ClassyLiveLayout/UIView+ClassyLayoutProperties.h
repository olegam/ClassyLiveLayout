//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE A/S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (ClassyLayoutProperties)

@property(nonatomic, assign) UIEdgeInsets cas_margin;
@property(nonatomic, assign) CGSize cas_size;

// shorthand properties for setting only a single constant value
@property(nonatomic, assign) CGFloat cas_sizeWidth;
@property(nonatomic, assign) CGFloat cas_sizeHeight;

@property(nonatomic, assign) CGFloat cas_marginTop;
@property(nonatomic, assign) CGFloat cas_marginLeft;
@property(nonatomic, assign) CGFloat cas_marginBottom;
@property(nonatomic, assign) CGFloat cas_marginRight;

+ (void)recursivelyUpdateStylingImmediately:(UIView *)view;

+ (CGSize)sizeFromStylesheet;

// Masonry shortcuts to make it easy to bind values to what is defined in classy stylesheet
- (NSArray *)mas_updateConstraintsWithTopMarginRelativeToSuperview;
- (NSArray *)mas_updateConstraintsWithLeftMarginRelativeToSuperview;
- (NSArray *)mas_updateConstraintsWithBottomMarginRelativeToSuperview;
- (NSArray *)mas_updateConstraintsWithRightMarginRelativeToSuperview;

// Slightly more verbose shortcuts to bind to another view or attribute than the superview
- (NSArray *)mas_updateConstraintsWithTopMarginRelativeTo:(id)attribute;
- (NSArray *)mas_updateConstraintsWithLeftMarginRelativeTo:(id)attribute;
- (NSArray *)mas_updateConstraintsWithBottomMarginRelativeTo:(id)attribute;
- (NSArray *)mas_updateConstraintsWithRightMarginRelativeTo:(id)attribute;
- (NSArray *)mas_updateConstraintsHeightFromStylesheet;
- (NSArray *)mas_updateConstraintsWidthFromStylesheet;

// Just a few simple shortcuts to be able to center in one line of code
- (NSArray *)mas_updateConstraintsCenterX;
- (NSArray *)mas_updateConstraintsCenterY;

@end