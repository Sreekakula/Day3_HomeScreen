//
//  UIPhoneBaseViewViewController.m
//  SampleCode
//
//  Created by Kiranmai Sreekakula on 11/07/15.
//  Copyright (c) 2015 Kiranmai Sreekakula01. All rights reserved.
//

#define RIGHT_BAR_BUTTON_WIDTH 16
#define LEFT_BAR_BUTTON_WIDTH 100

#import "UIPhoneBaseViewViewController.h"

@interface UIPhoneBaseViewViewController () {
    UIImageView *topImageView;
    UIView *plainView;
    UIView *noDataMessageView;
}
@property (nonatomic, strong) UIBarButtonItem *searchNavButton;
@property (nonatomic, strong) UIBarButtonItem *loginNavButton;
@property  (nonatomic,strong) UIBarButtonItem *logoNavImage;
@end

@implementation UIPhoneBaseViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    [self showNavBarItems:YES];
    UIView *view = (UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:0];
    if ([NSStringFromClass([view class]) isEqualToString:@"_UINavigationBarBackground"]) {
        [(UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:0] setBackgroundColor:[UIColor whiteColor]];
        [(UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:0] setAlpha:.9];
    }
    
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.translucent = YES;
}


-(void)showNavBarItems:(BOOL)show
{
    if (show) {
        
        UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                   target:nil
                                   action:nil];
        spacer.width = 20;
        self.navigationItem.rightBarButtonItems = @[self.loginNavButton,spacer,self.searchNavButton];
        /*
         bool isHomePage = [self.navigationController.topViewController isKindOfClass:[ULHomeViewController class]];
         if (isHomePage) {
         self.navigationItem.leftBarButtonItem = self.logoNavImage;
         }*/
    }
    else
    {
        self.navigationItem.rightBarButtonItems = nil;
    }
}

-(UIBarButtonItem*)logoNavImage
{
    if (!_logoNavImage) {
        UIImageView *logoImage =   [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 52, 44)];
        logoImage.image =[UIImage imageNamed:@"Logo.png"];
        logoImage.contentMode = UIViewContentModeScaleAspectFit;
        _logoNavImage = [[UIBarButtonItem alloc] initWithCustomView:logoImage];
    }
    return _logoNavImage;
}


- (UIBarButtonItem *)searchNavButton {
    if (!_searchNavButton) {
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [searchButton setImage:[UIImage imageNamed:@"Search.png"] forState:UIControlStateNormal];
        searchButton.frame = CGRectMake(0, (self.navigationController.navigationBar.frame.size.height-RIGHT_BAR_BUTTON_WIDTH)/2, RIGHT_BAR_BUTTON_WIDTH, RIGHT_BAR_BUTTON_WIDTH);
//        [searchButton addTarget:self action:@selector(searchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _searchNavButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
        
    }
    return _searchNavButton;
}

- (UIBarButtonItem *)loginNavButton {
    if (!_loginNavButton) {
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [searchButton setImage:[UIImage imageNamed:@"Search.png"] forState:UIControlStateNormal];
        searchButton.frame = CGRectMake(0, (self.navigationController.navigationBar.frame.size.height-RIGHT_BAR_BUTTON_WIDTH)/2, RIGHT_BAR_BUTTON_WIDTH, RIGHT_BAR_BUTTON_WIDTH);
//        [searchButton addTarget:self action:@selector(searchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _searchNavButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
        
    }
    return _searchNavButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) createULView:(UIView *)view {
    //UI Changes
    //    view.layer.cornerRadius=7.0;
    view.layer.borderWidth=0.5;
    view.layer.borderColor=[[UIColor grayColor] CGColor];
}



-(void) showPlainView {
    
    plainView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width+300, self.view.frame.size.height+300)];
    plainView.backgroundColor = self.view.backgroundColor;
    
    //[plainView addSubview:topImageView];
    [self.view addSubview:plainView];
    [self.view bringSubviewToFront:plainView];
}
-(void) removePlainView {
    [UIView animateWithDuration:1.0
                     animations:^{
                         [plainView setAlpha:0.0];
                     }];
    [noDataMessageView removeFromSuperview];
}

-(void)setNavigationBackButtonHidden{
    self.navigationItem.hidesBackButton = YES;
}





//-(void) setNavigationTitleWith:(NSString *)titleForNavBar backButtonTitle:(NSString*)titleForBackButton
//{
//    self.navigationController.navigationBar.topItem.title = titleForBackButton;
//    [self setNavigationTitleWith:titleForNavBar];
//    
//}


//-(void) setNavigationTitleWith:(NSString *)titleForNavBar {
//    NSString * finalTitle=@"";
//    if (![ULUtilityClass isStringNilNullEmpty:titleForNavBar]) {
//        NSArray* titles=[titleForNavBar componentsSeparatedByString:@" "];
//        for (NSMutableString *aString in titles) {
//            finalTitle=[finalTitle stringByAppendingString:[aString capitalizedString]];
//            finalTitle= [finalTitle stringByAppendingString:@" "];
//        }
//    }
//    [finalTitle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    self.navigationItem.titleView = [self labelNavigationBar:finalTitle];
//    
//}

//-(UILabel*)labelNavigationBar:(NSString*)title
//{
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,LABEL_WIDTH, self.navigationController.navigationBar.frame.size.height)];
//    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:16];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textColor = [UIColor colorWithRed:((float) 50 / 255.0f)
//                                           green:((float) 50 / 255.0f)
//                                            blue:((float) 50 / 255.0f)
//                                           alpha:1.0f];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
//    titleLabel.numberOfLines = 0;
//    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
//    NSMutableAttributedString *s = [[NSMutableAttributedString alloc] initWithString:title];
//    [s addAttribute:NSKernAttributeName
//              value:[NSNull null]
//              range:NSMakeRange(0, s.length)];
//    titleLabel.attributedText = s;
//    return titleLabel;
//}


//-(void)setNavigationBackButtonTitle:(NSString *)backButtonTitle
//{
//    
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:16]};
//    CGFloat titleWidth = [ULUtilityClass stringWidth:backButtonTitle withAttributes:attributes];
//    
//    
//    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(-5, (self.navigationController.navigationBar.frame.size.height-12)/2,12, 12)];
//    backImage.image =[UIImage imageNamed:@"back.png"];
//    [backImage setContentMode:UIViewContentModeScaleAspectFit];
//    
//    if (!(titleWidth > 0 && titleWidth < 90)) {
//        titleWidth = 90;
//    }
//    
//    UILabel *backTiltleLabel = [[UILabel alloc] initWithFrame:CGRectMake(backImage.frame.size.width,0,titleWidth, self.navigationController.navigationBar.frame.size.height)];
//    backTiltleLabel.text = backButtonTitle;
//    backTiltleLabel.textColor = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
//    backTiltleLabel.font =[UIFont fontWithName:@"HelveticaNeue-Light" size:16];
//    backTiltleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
//    backTiltleLabel.numberOfLines = 1;
//    backTiltleLabel.adjustsFontSizeToFitWidth = NO;
//    backTiltleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
//    [backTiltleLabel setContentMode:UIViewContentModeCenter];
//    
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(0, 0, titleWidth+12, self.navigationController.navigationBar.frame.size.height);
//    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIView *backButtonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, titleWidth+10, self.navigationController.navigationBar.frame.size.height)];
//    [backButtonContainer addSubview:backImage];
//    [backButtonContainer addSubview:backTiltleLabel];
//    [backButtonContainer addSubview:backButton];
//    
//    
//    UIBarButtonItem  *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButtonContainer];
//    
//    self.navigationItem.leftBarButtonItem = backButtonItem;
//}

-(void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

//-(void) setNavigationTitleWith:(NSString *)titleForNavBar  isCaseSensitive: (BOOL ) casesensitivity{
//    
//    if (casesensitivity) {
//        [titleForNavBar stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        titleLabel.text = titleForNavBar;
//        //        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
//        [titleLabel setFont:[UIFont systemFontOfSize:16]];
//        titleLabel.backgroundColor = [UIColor clearColor];
//        titleLabel.textColor = [UIColor blackColor];
//        [titleLabel sizeToFit];
//        self.navigationItem.titleView = titleLabel;
//    }
//    else
//    {
//        [self setNavigationTitleWith:titleForNavBar];
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
