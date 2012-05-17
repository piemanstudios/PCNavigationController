//
//  PCNavigationControllerOverride.m
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import "PCNavigationControllerOverride.h"

@implementation PCNavigationControllerOverride
@synthesize navBar;


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated; // Uses a horizontal slide transition. Has no effect if the view controller is already in the stack.
{
    // Add a new item onto the PCNavBar Stack
    [navBar pushItem:viewController.navigationItem animated:animated];
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated; // Returns the popped controller.
{
    // Remove a VC From the stack
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated; // Pops view controllers until the one specified is on top. Returns the popped controllers.
{
    [navBar popToItem:[[self viewControllers] indexOfObject:viewController] animated:animated];
    return [super popToViewController:viewController animated:animated];
}

@end

