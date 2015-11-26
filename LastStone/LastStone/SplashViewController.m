//
//  ViewController.m
//  LastStone
//
//  Created by deli on 15/9/29.
//  Copyright © 2015年 atleast. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController (){

    UIImageView *imageView;
    NSArray *images;
    int imageIndex;
    
    NSMutableArray *stones;
    NSMutableArray *stoneStatus;
    int removedNum;

}

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Do anything you like
        NSLog(@"initWithNibName");
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //添加几张图片作为指导页面
    images = [[NSArray alloc] initWithObjects:
              @"playGuide",
              @"enterGuide",
              @"cdn",
              nil];
    
    imageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //默认起始图片下标
    imageIndex = 0;
    //初始化imageView的默认图片
    imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];
    
    //---right swipe (default)---
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    [imageView addGestureRecognizer:swipeRight];
    
    //---left swipe---
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageView addGestureRecognizer:swipeLeft];
    
    //允许用户操作
    [imageView setUserInteractionEnabled:YES];
    //将imageView添加到mainWindow
    [self.view addSubview:imageView];
    
}

-(void) handleSwipeGesture:(UIGestureRecognizer *) gesture{

    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) gesture direction];
    
    NSLog(@"Before swipe: image count = %d and imageIndex = %d",(int)[images count], imageIndex);
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"Swipe up");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"Swipe down");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"Swipe left");
            imageIndex++;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"Swipe right");
            imageIndex--;
            break;
        default:
            break;
    }
    
    NSLog(@"After swipe: image count = %d and imageIndex = %d",(int)[images count], imageIndex);
    long imageCount = [images count];
    
    if(imageIndex < 0){
        //不再向左滑动
        imageIndex = 0;
        return;
    }else if(imageIndex >= 0 && imageIndex < imageCount){
        
        NSLog(@"ImageView is shown: image count = %d and imageIndex = %d",(int)[images count], imageIndex);
        imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];
        
    }else if (imageIndex == imageCount) {
        //如果滑动到最后一张，则移除imageView和手势
        [imageView removeFromSuperview];
        [self.view removeGestureRecognizer:gesture];
        
        stones = [[NSMutableArray alloc] init];
        stoneStatus = [[NSMutableArray alloc] init];
        
        //添加ImageButton来实现选择和取消操作
        for (int i = 0; i < 7; i++) {
            
            UIButton *stone = [[UIButton alloc] initWithFrame:CGRectMake(Width(30) * (i + 1) +  Width(120) * i, Height(300), Width(120), Height(120))];
            stone.tag = i;
            [stone setImage:[UIImage imageNamed:@"stone_0"] forState:UIControlStateNormal];
            [stone addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:stone];
            [stones insertObject:stone atIndex:i];
            [stoneStatus insertObject:@"0" atIndex:i];
            
        }
        
        //移除按钮
        UIButton *removeStone = [[UIButton alloc] initWithFrame:CGRectMake(Width(340), Height(1500), Width(400), Height(120))];
        removeStone.backgroundColor = [UIColor blackColor];
        [removeStone setTitle:@"Remove, Go!" forState:UIControlStateNormal];
        [removeStone addTarget:self action:@selector(removeStone:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:removeStone];
        
        return;
        
    }else{

        return;
    }
}
- (void) btnClicked:(UIButton *)btn{
    
    NSLog(@"Stone %ld is clicked.", btn.tag + 1);
    
    //更新状态
    if ([[stoneStatus objectAtIndex:btn.tag] isEqualToString:@"0"]) {
        
        [stoneStatus replaceObjectAtIndex:btn.tag withObject:@"1"];
        [[stones objectAtIndex:btn.tag] setImage:[UIImage imageNamed:@"stone_1"] forState:UIControlStateNormal];
        
    }else{
    
        [stoneStatus replaceObjectAtIndex:btn.tag withObject:@"0"];
        [[stones objectAtIndex:btn.tag] setImage:[UIImage imageNamed:@"stone_0"] forState:UIControlStateNormal];
    }
    
}

- (void) removeStone:(UIButton *)btn{
    
    NSLog(@"Remove stone button is clicked.");
    removedNum = 0;
    for (int i = 0; i < [stoneStatus count]; i++) {
        
        if ([[stoneStatus objectAtIndex:i] isEqualToString:@"1"]){
            
            [[stones objectAtIndex:i] removeFromSuperview];
            removedNum++;
        }
    }
    
    if (removedNum == [stoneStatus count]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over!" message:@"You win!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Done", nil];
        [alert show];
    }
    
}

/*
//成员变量
@synthesize textField;
@synthesize buttonStatus;
@synthesize slideNum;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize buttonShowAndHide;pe

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
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end