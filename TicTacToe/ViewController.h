//
//  ViewController.h
//  TicTacToe
//
//  Created by Thomas Harker on 10/27/16.
//  Copyright © 2016 Thomas Harker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
IBOutlet UIImage * oImg;
IBOutlet UIImage * xImg;

NSInteger playerToken;

IBOutlet UIImageView * board;
IBOutlet UILabel * whoseTurn;
IBOutlet UIButton * resetButton;
}
- (IBAction)buttonReset:(UIButton *)sender;
- (IBAction)buttonSwap:(UITapGestureRecognizer *)img;

-(void) updatePlayerInfo;
-(BOOL) checkForWin;

@property int turns;
@property (weak, nonatomic) IBOutlet UIImageView * s1;
@property (weak, nonatomic) IBOutlet UIImageView * s2;
@property (weak, nonatomic) IBOutlet UIImageView * s3;
@property (weak, nonatomic) IBOutlet UIImageView * s4;
@property (weak, nonatomic) IBOutlet UIImageView * s5;
@property (weak, nonatomic) IBOutlet UIImageView * s6;
@property (weak, nonatomic) IBOutlet UIImageView * s7;
@property (weak, nonatomic) IBOutlet UIImageView * s8;
@property (weak, nonatomic) IBOutlet UIImageView * s9;

@end

