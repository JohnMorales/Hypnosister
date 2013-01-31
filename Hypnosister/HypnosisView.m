//
//  HypnosisView.m
//  Hypnosister
//
//  Created by John Morales on 1/30/13.
//  Copyright (c) 2013 John Morales. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    CGContextSetLineWidth(ctx, 10);
    
    [[UIColor lightGrayColor] setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2., YES);
        
        CGContextStrokePath(ctx);
    }
    
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    textRect.size = [text sizeWithFont:font];
    
    textRect.origin.x = center.x - textRect.size.width / 2.;
    textRect.origin.y = center.y - textRect.size.height / 2.;
    
    [[UIColor blackColor] setFill];
    

    
    CGSize offset = CGSizeMake(4, 3);
    
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    CGContextSetShadowWithColor(ctx, offset, 2., color);
    
    [text drawInRect:textRect withFont:font];
}
@end
