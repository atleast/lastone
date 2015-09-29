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

@synthesize textField;
@synthesize buttonStatus;
@synthesize slideNum;

- (IBAction)didInput:(id)sender{
    
    [sender resignFirstResponder];
}

- (IBAction)tapBg:(id)sender{

    [textField resignFirstResponder];
}

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

- (IBAction)btnPressed:(id)sender {
    
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    buttonStatus.text = [[NSString alloc] initWithFormat:@"%@ button is pressed.", btnTitle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSlider:(id)sender {
    
    UISlider *slider = (UISlider *) sender;
    int progressAsInt = (int) roundf(slider.value);
    slideNum.text = [NSString stringWithFormat:@"%d", progressAsInt];
}
@end