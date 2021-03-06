//
//  HomeViewController.h
//  SampleCode
//
//  Created by Kiranmai Sreekakula01 on 07/07/15.
//  Copyright (c) 2015 Kiranmai Sreekakula01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollerItemControl.h"
#import "iCarousel.h"
#import "UIPhoneBaseViewViewController.h"

@interface HomeViewController : UIPhoneBaseViewViewController<UIScrollViewDelegate,ProductScrollViewDelegate,iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong) ScrollerItemControl  *adScroller;
@property (weak, nonatomic) IBOutlet UIPageControl *adPageControl;
@property (strong, nonatomic) IBOutlet UIView *adScrollView;
-(void) setSlideShowUsing:(NSArray *)slideDetails;
@property (weak, nonatomic) IBOutlet iCarousel *carouselView;

@end
