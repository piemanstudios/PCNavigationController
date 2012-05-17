//
//  PCNavigationBarItem.m
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import "PCNavigationBarItem.h"

@implementation PCNavigationBarItem
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        /*
        backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [backgroundImage setImage:[[UIImage imageNamed:@"Test Button.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:15]];
        [self addSubview:backgroundImage];
         */
        
        backgroundImage = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [backgroundImage addTarget:self action:@selector(sendTappedMessage) forControlEvents:UIControlEventTouchUpInside];
        [backgroundImage setBackgroundImage:[[UIImage imageNamed:@"Arrow1.png"] stretchableImageWithLeftCapWidth:26 topCapHeight:22] forState:UIControlStateNormal];
        [backgroundImage setBackgroundImage:[[UIImage imageNamed:@"Arrow1Selected.png"] stretchableImageWithLeftCapWidth:26 topCapHeight:22] forState:UIControlStateHighlighted];
        [backgroundImage setBackgroundImage:[[UIImage imageNamed:@"Arrow1Selected.png"] stretchableImageWithLeftCapWidth:26 topCapHeight:22] forState:UIControlStateSelected];

        label = [[UILabel alloc] initWithFrame:CGRectMake(18, 7, frame.size.width - 30, 30)];
        [label setFont:[UIFont boldSystemFontOfSize:18]];
        [label setTextColor:[UIColor colorWithRed:163/256.0 green:181.0/256.0 blue:91.0/256.0 alpha:1]];
        [label setShadowColor:[UIColor blackColor]];
        [label setShadowOffset:CGSizeMake(0, -1)];
        [label setTextAlignment:UITextAlignmentCenter];
        [label setText:title];
        [label setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:backgroundImage];
        [self addSubview:label];

    }
    return self;
}

-(void)sendTappedMessage;
{
    [self.delegate pcNavigationBarItemWasTapped:self];
}

-(void)setBarItemItemIndex:(int)index;
{
    barItemIndex = index;
}

-(int)getBarItemIndex;
{
    return barItemIndex;
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
