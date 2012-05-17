//
//  PCNavigationBar.m
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import "PCNavigationBar.h"

#define NAVIGATION_ANIMATION_TIME 0.7
#define BAR_ARROW_WIDTH 15
#define X_OFFSET 16

@interface PCNavigationBar ()

// Pushing/Popping items
-(void)addItemToStack:(PCNavigationBarItem *)item animated:(BOOL)animated;
-(void)removeItemFromStack:(PCNavigationBarItem *)item animated:(BOOL)animated;
-(void)popToRoot;

// Animation timer handler
-(void)timerCalled:(NSTimer *)timer;

// Redrawing items
-(void)removeItemFromScreen:(PCNavigationBarItem *)item;

@end

@implementation PCNavigationBar
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithRed:44.0/256.0 green:44.0/256.0 blue:44.0/256.0 alpha:1]];
        barItems = [[NSMutableArray alloc] init];
    }
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


-(void)pushItem:(UINavigationItem *)title animated:(BOOL)animated;
{
    PCNavigationBarItem *item = [self getPCBarItemForNavigationItem:title];
    [item setDelegate:self];
    [self addItemToStack:item animated:animated];
}


-(void)popItem:(PCNavigationBarItem *)item animated:(BOOL)animated;
{
    [self removeItemFromStack:item animated:animated];
}


-(void)popToItem:(NSInteger)index animated:(BOOL)animated;
{
    NSMutableArray *toPop = [[NSMutableArray alloc] init];
    for (int i = index + 1; i < [barItems count]; i ++) {
        [toPop addObject:[barItems objectAtIndex:i]];
    }
    for (PCNavigationBarItem *item in toPop) {
        [self popItem:item animated:animated];
    }
}

-(PCNavigationBarItem *)getPCBarItemForNavigationItem:(UINavigationItem *)navItem;
{
    // Need to declare the title in the init method of the VC!
    NSLog(@"%@",navItem.title);
    PCNavigationBarItem *item = [[PCNavigationBarItem alloc] initWithFrame:CGRectMake(self.frame.size.width + [self getCurrentWidth], 0, [self getWidthForTitle:navItem.title], 44) withTitle:navItem.title];
    return item;
}

#pragma mark - Getting dimensions

-(CGFloat)getWidthForTitle:(NSString *)title;
{
	CGSize maximumLabelSize = CGSizeMake(9999,30);
	CGSize expectedLabelSize = [title sizeWithFont:[UIFont boldSystemFontOfSize:18] constrainedToSize:maximumLabelSize lineBreakMode:UILineBreakModeWordWrap]; 
	return expectedLabelSize.width + 30;
}

-(CGFloat)getCurrentWidth;
{
    // Sum the size of all of the barItems
    CGFloat total = 0;
    for (PCNavigationBarItem *item in barItems) {
        total += item.frame.size.width;
    }
    
    total -= [barItems count]*BAR_ARROW_WIDTH;
    
    return total;
}

#pragma mark - Animation

-(void)addItemToStack:(PCNavigationBarItem *)item animated:(BOOL)animated;
{
    [barItems addObject:item];
    [self addSubview:item];

    CGRect currentFrame = item.frame;

    if (animated) {
        [UIView beginAnimations:nil context:NULL];
        [item setFrame:CGRectMake(currentFrame.origin.x - self.frame.size.width - X_OFFSET, currentFrame.origin.y, currentFrame.size.width, currentFrame.size.height)];
        [UIView setAnimationDuration:NAVIGATION_ANIMATION_TIME];
        [UIView commitAnimations];        
    }
    else {
        [item setFrame:CGRectMake(currentFrame.origin.x - self.frame.size.width - X_OFFSET, currentFrame.origin.y, currentFrame.size.width, currentFrame.size.height)];
    }
}

-(void)removeItemFromStack:(PCNavigationBarItem *)item animated:(BOOL)animated;
{
    if (animated) {
        
        [UIView beginAnimations:nil context:NULL];
        CGRect currentFrame = item.frame;
        [item setFrame:CGRectMake(currentFrame.origin.x + self.frame.size.width, currentFrame.origin.y, currentFrame.size.width, currentFrame.size.height)];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(removeItem:)];
        [UIView setAnimationDuration:NAVIGATION_ANIMATION_TIME];
        [UIView commitAnimations];
        
        [NSTimer scheduledTimerWithTimeInterval:NAVIGATION_ANIMATION_TIME target:self selector:@selector(timerCalled:) userInfo:item repeats:NO];
    }
    else {
        [self removeItemFromScreen:item];
    }
    [barItems removeObject:item];
}

-(void)timerCalled:(NSTimer *)timer;
{
    [self removeItemFromScreen:[timer userInfo]];
}

-(void)removeItemFromScreen:(PCNavigationBarItem *)item;
{
    [item removeFromSuperview];
    [item release];    
}

-(void)popToRoot;
{
    
}

#pragma mark - PCNavigationBarItemDelegate

-(void)pcNavigationBarItemWasTapped:(PCNavigationBarItem *)item;
{
    NSLog(@"Tapped!");
    [self.delegate pcNavigationBar:self didSelectItemAtIndex:[barItems indexOfObject:item]];
}

@end
