//
//  PCNavigationBarItem.h
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PCNavigationBarItemDelegate;

@interface PCNavigationBarItem : UIView {
    id <PCNavigationBarItemDelegate> delegate;

    //UIImageView *backgroundImage; // -> change this to a uibutton?
    UIButton *backgroundImage;
    UILabel *label;
    int barItemIndex;
}
@property(nonatomic,  assign) id <PCNavigationBarItemDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

-(void)sendTappedMessage;

-(void)setBarItemItemIndex:(int)index;
-(int)getBarItemIndex;
@end

@protocol PCNavigationBarItemDelegate
-(void)pcNavigationBarItemWasTapped:(PCNavigationBarItem *)item;
@end