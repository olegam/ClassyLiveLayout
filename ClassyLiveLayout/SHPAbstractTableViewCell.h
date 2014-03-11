//
//  Created by Ole Gammelgaard Poulsen on 13/02/14.
//  Copyright (c) 2014 SHAPE A/S. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SHPAbstractTableViewCell : UITableViewCell

// You must override these methods in subclasses

// Override this method and add all subviews to the contentView in it
- (void)addSubviews;

// Override this method and use the mas_updateConstraints... methods to add constraints
// It's important to use the 'update' methods as this may be called multiple times.
- (void)defineLayout;

@end