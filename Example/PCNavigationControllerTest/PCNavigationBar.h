//
//  PCNavigationBar.h
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "PCNavigationBarItem.h"

@protocol PCNavigationBarDelegate;

@interface PCNavigationBar : UIView <PCNavigationBarItemDelegate> {
    
    id <PCNavigationBarDelegate> delegate;
    NSMutableArray *barItems;
   // int itemCount;
}
@property (nonatomic,assign) id <PCNavigationBarDelegate> delegate;

-(void)pushItem:(UINavigationItem *)title animated:(BOOL)animated;
-(void)popItem:(PCNavigationBarItem *)item animated:(BOOL)animated;;
-(void)popToItem:(NSInteger)index animated:(BOOL)animated;;

-(PCNavigationBarItem *)getPCBarItemForNavigationItem:(UINavigationItem *)navItem;

-(CGFloat)getWidthForTitle:(NSString *)title;
-(CGFloat)getCurrentWidth;


@end

@protocol PCNavigationBarDelegate
-(void)pcNavigationBar:(PCNavigationBar *)bar didSelectItemAtIndex:(int)index;
@end