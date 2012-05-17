//
//  PCNavigationController.m
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import "PCNavigationController.h"

@implementation PCNavigationController
@synthesize navigationBar, navigationController;

- (id)initWithRootViewController:(UIViewController *)root;
{
    self = [super init];
    if (self) {
        
        
        [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        
        [self.view setBackgroundColor:[UIColor redColor]];
        navigationBar = [[PCNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        [navigationBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
        [navigationBar setDelegate:self];
        [self.view addSubview:navigationBar];
        
        navigationController = [[PCNavigationControllerOverride alloc] init];
        [navigationController setNavBar:navigationBar];
        [navigationController setNavigationBarHidden:YES];
        [navigationController.view setFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44)];
        [navigationController setDelegate:self];
        [self.view addSubview:navigationController.view];
        
        [self setRootViewController:root];
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}



#pragma mark - Navigation

-(void)setRootViewController:(UIViewController *)controller;
{
    if (controller != nil) {
        [navigationController pushViewController:controller animated:NO];        
    }
}

-(void)pushViewController:(UIViewController *)controller animated:(BOOL)animated;
{
    [navigationController pushViewController:controller animated:animated];
}

-(void)popViewControllerAnimated:(BOOL)animated;
{
    [navigationController popViewControllerAnimated:animated];
}

-(void)popToViewController:(UIViewController *)controller Animated:(BOOL)animated;
{
    [navigationController popToViewController:controller animated:animated];
}

#pragma mark - PCNavigationBarDelegate

-(void)pcNavigationBar:(PCNavigationBar *)bar didSelectItemAtIndex:(int)index;
{
    // Pop to the VC at that index
    [navigationController popToViewController:[[navigationController viewControllers] objectAtIndex:index] animated:YES];
}

@end
