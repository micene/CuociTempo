//
//  CTTimerViewController.h
//  CuociTempo
//
//  Created by Michele Navolio on 18/11/13.
//  Copyright (c) 2013 Michele Navolio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *lancetta;
@property (strong, nonatomic) NSTimer *theTimer;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

/*@property (assign,nonatomic)int peso;
 @property (assign,nonatomic)NSString* cottura;
 
 @property (nonatomic, strong) Tempo *tempo;*/

+(BOOL)timerIsRunnig;

@end