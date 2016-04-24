//
//  myView.m
//  AutolayoutTutorial
//
//  Created by Giuseppe Santaniello on 31/08/13.
//  Copyright (c) 2013 Giuseppe Santaniello. All rights reserved.
//

#import "myView.h"
#import "UIColor+Random.h"

@implementation myView


- (void)setup
{
    self.backgroundColor = [UIColor randomColor];
    self.opaque = NO;
}

- (void)awakeFromNib
{
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
