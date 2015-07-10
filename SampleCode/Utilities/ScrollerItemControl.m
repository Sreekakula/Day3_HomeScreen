//
//  ScrollerItemControl.m
//  ulta
//
//  Created by Sreeram Ramji on 17/07/12.
//  Copyright (c) 2012 Infosys. All rights reserved.
//

#import "ScrollerItemControl.h"
#import "ScrollerItem.h"
//#import "ULRatingView.h"
//#import "ASIHTTPRequest.h"
//#import "CompuwareUEM.h"
//#import "ULTABusiness.h"

@interface ScrollerItemControl () {
    UIActivityIndicatorView *activityIndicator;
    int noOfImagesAdded;
    NSInteger totalNoOfImages;
    int pageNumber;
    NSString *selectedType;
    BOOL isFetchData;
    }
@property (nonatomic, assign) CGFloat lastContentOffset;
@end

typedef enum ScrollDirection {
    ScrollDirectionUp,
    ScrollDirectionDown,
} ScrollDirection;

@implementation ScrollerItemControl

//@synthesize requestForPromoSliderImages;



#pragma mark - Product selection
-(void)scrollViewforFrame:(CGRect )scrollFrame withObjects:(NSArray *)arrModelObjects withImageSize:(CGSize) imgSize forType:(ULHorizontalScrollViewType)horizontalScrollViewType withOffset:(float)offset withSpacingBetweenObjects:(float)spacingBetweenObjects
{
    noOfImagesAdded = 0;
    totalNoOfImages = [arrModelObjects count];
    self.products=arrModelObjects;
    self.frame=scrollFrame;
    switch (horizontalScrollViewType) {
             case ULHorizontalScrollViewTypeAdControl:
            
            selectedType = @"ULHorizontalScrollViewTypeAdControl";
            
            float padding = 0.0;
            
            for(int iCount=0; iCount<[arrModelObjects count] ; iCount++)
            {
                UIControl *controlViewForSimilarProducts=[[UIControl alloc]initWithFrame:CGRectMake(iCount*imgSize.width,0,imgSize.width,imgSize.height)];
                CGRect frame=controlViewForSimilarProducts.frame;
                [controlViewForSimilarProducts setTag:(iCount+1000)];
                [controlViewForSimilarProducts addTarget:self action:@selector(didSelectImageCtrl:)
                                        forControlEvents:UIControlEventTouchUpInside];
                [controlViewForSimilarProducts setEnabled:NO];
                       //Setting the frames for the images
                UIImageView   *imageViewForDifferentColors1=[[UIImageView alloc]initWithFrame:CGRectMake(padding,padding,(imgSize.width-2*padding),imgSize.height)];
                CGRect frame1 = imageViewForDifferentColors1.frame;
                imageViewForDifferentColors1.tag = (iCount+1000);
                if (iCount==0) {
                    [controlViewForSimilarProducts setBackgroundColor:[UIColor redColor]];
                    [imageViewForDifferentColors1 setBackgroundColor:[UIColor blackColor]];
                }
                else if(iCount==1) {
                    [controlViewForSimilarProducts setBackgroundColor:[UIColor purpleColor]];
                    [imageViewForDifferentColors1 setBackgroundColor:[UIColor blackColor]];
                }
                else if(iCount==2) {
                    [controlViewForSimilarProducts setBackgroundColor:[UIColor blackColor]];
                    [imageViewForDifferentColors1 setBackgroundColor:[UIColor purpleColor]];
                }
                else if(iCount==3) {
                    [controlViewForSimilarProducts setBackgroundColor:[UIColor blueColor]];
                    [imageViewForDifferentColors1 setBackgroundColor:[UIColor greenColor]];
                }
                else if(iCount==4) {
                    [controlViewForSimilarProducts setBackgroundColor:[UIColor greenColor]];
                    [imageViewForDifferentColors1 setBackgroundColor:[UIColor blackColor]];
                }
                
                //Setting the dummy image and loading the images asynchronously using ASIHTTP
             [imageViewForDifferentColors1 setImage:[UIImage imageNamed:@"home.png"]];
                activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                activityIndicator.frame = CGRectMake((controlViewForSimilarProducts.frame.size.width-100)/2, (controlViewForSimilarProducts.frame.size.height-100)/2, 100, 100);
                [activityIndicator setTag:(iCount+1000)];
                [activityIndicator startAnimating];
               
                imageViewForDifferentColors1.hidden=FALSE;
                imageViewForDifferentColors1.opaque=TRUE;
                    [controlViewForSimilarProducts addSubview:imageViewForDifferentColors1];
                [controlViewForSimilarProducts bringSubviewToFront:activityIndicator];
                [self addSubview:controlViewForSimilarProducts];
            }
            
            [self setContentSize:CGSizeMake((imgSize.width*[arrModelObjects count]), imgSize.height)];
            [self setShowsHorizontalScrollIndicator:NO];
            [self setShowsVerticalScrollIndicator:NO];
            
            [self setPagingEnabled:YES];
            break;
            
        default:
            break;
            
    }
    
    [self setScrollEnabled:TRUE];
}

-(void)didSelectImageCtrl:(id)sender {
    NSInteger iTag=[sender tag];
    if (iTag>=1000) {
        iTag = iTag-1000;
    }
    if (self.scrollViewDelegate != nil && [self.scrollViewDelegate respondsToSelector:@selector(cellselectedProduct:andForType:)]) {
        ScrollerItem *productObject= [self.products objectAtIndex:iTag];
        [self.scrollViewDelegate cellselectedProduct:productObject andForType:selectedType];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    ScrollDirection scrollDirection ;
    if (pageNumber == scrollView.contentOffset.y)
        scrollDirection = ScrollDirectionUp;
    else if (pageNumber > scrollView.contentOffset.y)
        scrollDirection = ScrollDirectionDown;
        pageNumber = scrollView.contentOffset.y;
        CGFloat pageHeight = scrollView.frame.size.height;
        int page = (floor((scrollView.contentOffset.y - pageHeight / 2) / pageHeight)+1)+1;
    
        if (page != 1 && scrollDirection == ScrollDirectionUp) {
            //call webservice logic
            
            isFetchData = NO;
            page = 0;
        }
}

@end