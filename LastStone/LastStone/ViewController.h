//
//  ViewController.h
//  LastStone
//
//  Created by deli on 15/9/29.
//  Copyright © 2015年 atleast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)btnClicked:(id)sender;
- (IBAction)didInput:(id)sender;
- (IBAction)tapBg:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *buttonStatus;
- (IBAction)btnPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *slideNum;
- (IBAction)changeSlider:(id)sender;

@end