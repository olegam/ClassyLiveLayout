//
//  Created by Ole Gammelgaard Poulsen on 15/12/13.
//  Copyright (c) 2013 SHAPE A/S. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+ClassyLayoutProperties.h"


@implementation UIView (ClassyLayoutProperties)

- (UIEdgeInsets)cas_margin {
	return [(NSValue *) objc_getAssociatedObject(self, @selector(cas_margin)) UIEdgeInsetsValue];
}


- (void)setCas_margin:(UIEdgeInsets)cas_margin {
	[self willChangeValueForKey:@"cas_margin"];
	NSValue *value = [NSValue valueWithUIEdgeInsets:cas_margin];
	objc_setAssociatedObject(self, @selector(cas_margin), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	[self didChangeValueForKey:@"cas_margin"];
	[self.superview setNeedsUpdateConstraints];
}

- (CGSize)cas_size {
	return [(NSValue *) objc_getAssociatedObject(self, @selector(cas_size)) CGSizeValue];
}


- (void)setCas_size:(CGSize)cas_size {
	[self willChangeValueForKey:@"cas_size"];
	NSValue *value = [NSValue valueWithCGSize:cas_size];
	objc_setAssociatedObject(self, @selector(cas_size), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	[self didChangeValueForKey:@"cas_size"];
	[self.superview setNeedsUpdateConstraints];
}


@end