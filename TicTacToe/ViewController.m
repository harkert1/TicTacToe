//
//  ViewController.m
//  TicTacToe
//
//  Created by Thomas Harker on 10/27/16.
//  Copyright © 2016 Thomas Harker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[board setImage:[UIImage imageNamed:@"ttt_board.png"]];;
    // add the images
    oImg = [UIImage imageNamed:@"o_img.png"];
    xImg = [UIImage imageNamed:@"x_img.png"];
    
    // Used to check for ties
    self.turns = 0;
    
    // set the player to 1
    playerToken = 1;
    // update the label
    
    whoseTurn.text =@"X Goes First";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Start a new Tic Tac Toe Game
- (IBAction)buttonReset:(UIButton *)sender {
    playerToken = 1;
    self.s1.image = nil;
    self.s2.image = nil;
    self.s3.image = nil;
    self.s4.image = nil;
    self.s5.image = nil;
    self.s6.image = nil;
    self.s7.image = nil;
    self.s8.image = nil;
    self.s9.image = nil;
    whoseTurn.text = @"X Goes First";
    self.turns = 0;
}

// Method called when player interacts with the board.
// Changes empty square to an X or O depending on the turn
- (IBAction)buttonSwap:(UITapGestureRecognizer *)img {
    UIImageView *view = (UIImageView *)img.view;
    NSData *imgDataView = UIImagePNGRepresentation(view.image);
    NSData *imgDataX = UIImagePNGRepresentation(xImg);
    NSData *imgDataO = UIImagePNGRepresentation(oImg);
    if(![self checkForWin]) {
        if(playerToken == 1) {
            if(![imgDataView isEqualToData:imgDataO]) {
                view.image = xImg;
                [self updatePlayerInfo];
            }
        }
        else {
            if(![imgDataView isEqualToData:imgDataX]) {
                view.image = oImg;
                [self updatePlayerInfo];
            }
    }
    }
}

// Changes the player turn token and updates the number of turns.
// Updates label indicating whose turn it is.
-(void) updatePlayerInfo {
    if(![self checkForWin]) {
        if(_turns != 8) {
            if(playerToken == 1) {
                playerToken = 0;
                self.turns++;
                whoseTurn.text = @"Player O's Turn";
            }
            else {
                playerToken = 1;
                self.turns++;
                whoseTurn.text = @"Player X's Turn";
            }
        }
        else {
            whoseTurn.text = @"Tie Game!";
        }
    }
    else {
        if(playerToken == 1) {
            whoseTurn.text = @"Player X Wins!";
        }
        else {
            whoseTurn.text = @"Player O Wins!";
        }
    }
}

// Used to determine if a player has won the game.
-(BOOL) checkForWin {
    BOOL win = false;
    // image data for comparison
    NSData *imgData1 = UIImagePNGRepresentation(self.s1.image);
    NSData *imgData2 = UIImagePNGRepresentation(self.s2.image);
    NSData *imgData3 = UIImagePNGRepresentation(self.s3.image);
    NSData *imgData4 = UIImagePNGRepresentation(self.s4.image);
    NSData *imgData5 = UIImagePNGRepresentation(self.s5.image);
    NSData *imgData6 = UIImagePNGRepresentation(self.s6.image);
    NSData *imgData7 = UIImagePNGRepresentation(self.s7.image);
    NSData *imgData8 = UIImagePNGRepresentation(self.s8.image);
    NSData *imgData9 = UIImagePNGRepresentation(self.s9.image);
    NSData *imgDataWin;
    
    if(playerToken == 1) {
        imgDataWin = UIImagePNGRepresentation(xImg);
    }
    else {
        imgDataWin = UIImagePNGRepresentation(oImg);
    }
    
    // horizontal wins
    if([imgData1 isEqualToData:imgData2] && [imgData2 isEqualToData:imgData3] && [imgData1 isEqualToData:imgDataWin])
        win = true;
    else if ([imgData4 isEqualToData:imgData5] && [imgData5 isEqualToData:imgData6] && [imgData4 isEqualToData:imgDataWin])
        win = true;
    else if ([imgData7 isEqualToData:imgData8] && [imgData8 isEqualToData:imgData9] && [imgData7 isEqualToData:imgDataWin])
        win = true;
    
    // vertical wins
    else if ([imgData1 isEqualToData:imgData4] && [imgData4 isEqualToData:imgData7] && [imgData1 isEqualToData:imgDataWin])
        win = true;
    else if ([imgData2 isEqualToData:imgData5] && [imgData5 isEqualToData:imgData8] && [imgData2 isEqualToData:imgDataWin])
        win = true;
    else if ([imgData3 isEqualToData:imgData6] && [imgData6 isEqualToData:imgData9] && [imgData3 isEqualToData:imgDataWin])
        win = true;
    
    // diagonal wins
    else if ([imgData1 isEqualToData:imgData5] && [imgData5 isEqualToData:imgData9] && [imgData1 isEqualToData:imgDataWin])
        win = true;
    else if ([imgData3 isEqualToData:imgData5] && [imgData5 isEqualToData:imgData7] && [imgData3 isEqualToData:imgDataWin])
        win = true;
    
    return win;
}

@end
