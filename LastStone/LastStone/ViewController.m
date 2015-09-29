//
//  ViewController.m
//  LastStone
//
//  Created by deli on 15/9/29.
//  Copyright © 2015年 atleast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//成员变量
@synthesize textField;
@synthesize buttonStatus;
@synthesize slideNum;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize buttonShowAndHide;

//在键盘上点击Return
- (IBAction)didInput:(id)sender{
    
    [sender resignFirstResponder];
}

//点击屏幕其他位置
- (IBAction)tapBg:(id)sender{

    [textField resignFirstResponder];
}

//点击Button, 显示Alert
- (IBAction)btnClicked:(id)sender {
    
    NSString *str = [[NSString alloc] initWithFormat:@"Hello, %@", textField.text];
    UIAlertView *alter = [[UIAlertView alloc]
                          initWithTitle:@"Say hello"
                          message:str
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alter show];
}

//点击Button, 改变Lable文字
- (IBAction)btnPressed:(id)sender {
    
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    buttonStatus.text = [[NSString alloc] initWithFormat:@"%@ button is pressed.", btnTitle];
}

//滑动Slider
- (IBAction)changeSlider:(id)sender {
    
    UISlider *slider = (UISlider *) sender;
    int progressAsInt = (int) roundf(slider.value);
    slideNum.text = [NSString stringWithFormat:@"%d", progressAsInt];
}

//选择Switch
- (IBAction)switchChanged:(id)sender {
    
    UISwitch *whichSwitch = (UISwitch *) sender;
    BOOL setting = whichSwitch.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

//点击Segments
- (IBAction)toggleChanged:(id)sender {
    
    if ([sender selectedSegmentIndex] == 0) {
        
        leftSwitch.hidden = NO;
        rightSwitch.hidden = NO;
        buttonShowAndHide.hidden =YES;
        
    } else {
        
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        buttonShowAndHide.hidden = NO;
    }
}

//点击Button,调用ActionSheet
- (IBAction)shownAndPressed:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Look what?"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:@"Beauty"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

//通过Delegate(代理模式)重写 clickedButtonAtIndex didDismissWithButtonIndex 调用AlertView
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Hello, beauty"
                              message:@"Please look into the mirror"
                              delegate:self
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
    }

}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == [actionSheet cancelButtonIndex]) {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Hello, "
                              message:@"Why do you NOT click above button?"
                              delegate:self
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

