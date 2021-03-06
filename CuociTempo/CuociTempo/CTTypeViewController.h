//
//  CTTypeViewController.h
//  CuociTempo
//
//  Created by Michele Navolio on 18/11/13.
//  Copyright (c) 2013 Michele Navolio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTypeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *pressioneImage;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pressioneTapGesture;

@property (weak, nonatomic) IBOutlet UIButton *listaButton;
@property (weak, nonatomic) IBOutlet UIButton *preferitiButton;

@property (assign, nonatomic) NSInteger index;

@property (retain,nonatomic)NSString *animationForKey;
@property (retain,nonatomic)NSMutableArray *images;

@end
