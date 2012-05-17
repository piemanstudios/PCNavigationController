//
//  PCNavigationControllerOverride.h
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCNavigationBar.h"


@interface PCNavigationControllerOverride : UINavigationController {
    
    PCNavigationBar *navBar;
}
@property (nonatomic,retain) PCNavigationBar *navBar;

@end
