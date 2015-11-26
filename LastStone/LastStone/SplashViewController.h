//
//  ViewController.h
//  LastStone
//
//  Created by deli on 15/9/29.
//  Copyright © 2015年 atleast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController <UIActionSheetDelegate>

//定义屏幕参数
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

//宽度适配
#define Width(x) ((float)x * ((float)(ScreenWidth)/(float)1080))
//高度适配
#define Height(y) ((float)y * ((float)(ScreenHeight)/(float)1920))

/*
//UITextField, UIButtoon, KeyBoard
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)btnClicked:(id)sender;
- (IBAction)didInput:(id)sender;
- (IBAction)tapBg:(id)sender;

//Button
@property (weak, nonatomic) IBOutlet UILabel *buttonStatus;
- (IBAction)btnPressed:(id)sender;

//Slider
@property (weak, nonatomic) IBOutlet UILabel *slideNum;
- (IBAction)changeSlider:(id)sender;

//Switch, Segments
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *buttonShowAndHide;

- (IBAction)switchChanged:(id)sender;
- (IBAction)toggleChanged:(id)sender;
- (IBAction)shownAndPressed:(id)sender;
*/

@end