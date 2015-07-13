//
//  UIPhoneBaseViewViewController.h
//  SampleCode
//
//  Created by Kiranmai Sreekakula on 11/07/15.
//  Copyright (c) 2015 Kiranmai Sreekakula01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPhoneBaseViewViewController : UIViewController
- (UIBarButtonItem *)searchNavButton;
- (UIBarButtonItem *)loginNavButton;
-(UIBarButtonItem*)logoNavImage;
-(void) showNavBarItems:(BOOL)show;;
@end
