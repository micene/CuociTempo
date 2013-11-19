//
//  CTTypeViewController.m
//  CuociTempo
//
//  Created by Michele Navolio on 18/11/13.
//  Copyright (c) 2013 Michele Navolio. All rights reserved.
//

#import "CTTypeViewController.h"
#import "CTPieViewController.h"

@interface CTTypeViewController (){
    
    NSMutableArray *imagesArr;
    int currentImage;
    BOOL stopRequested;
    NSTimeInterval duration;
    NSArray *imageNames;
    
}@end

@implementation CTTypeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.pressioneTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToPressionePie:)];
    [self.pressioneImage addGestureRecognizer:self.pressioneTapGesture];
    
    if ([self.title isEqualToString:@"Pressione"]) {
        
        imageNames = @[@"pressione.png", @"win_2.png", @"win_3.png"];
        
    }else if ([self.title isEqualToString:@"Normale"]) {
        
        imageNames = @[@"normale.png", @"win_15.png", @"win_16.png"];
        
    }if ([self.title isEqualToString:@"Microonde"]) {
        
        imageNames = @[@"microonde.png", @"win_8.png", @"win_12.png"];
        
    }
    
    self.images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [self.images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    self.pressioneImage.image = [self.images objectAtIndex:0];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.pressioneImage.userInteractionEnabled = YES;
    currentImage = 0;
    
}

-(void) setupTheAnimation {
    
    self.pressioneImage.userInteractionEnabled = NO;
    
    stopRequested = NO;
    currentImage = 1;
    duration = 1/self.images.count+1;
    NSLog(@"%f",duration);
    [self stepThroughImages];
    
    [self performSelector:@selector(stopTheAnimation) withObject:nil afterDelay:4.0];
}

- (void) stepThroughImages{
    
    self.pressioneImage.image = [self.images objectAtIndex: currentImage];
    
    if (currentImage != self.images.count-1) {
        
        currentImage++;
        
    }
    if (stopRequested && duration < 0.1f) {
        
        // we're slowing down gradually
        duration *= 1.1f;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self stepThroughImages];
        });
    } else if (!stopRequested) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self stepThroughImages];
        });
    }
}

-(void) stopTheAnimation {
    
    NSLog(@"stop");
    
    stopRequested = YES;
    
    CTPieViewController *pieView = [self.storyboard instantiateViewControllerWithIdentifier:@"PieView"];
    pieView.title = self.title;
    CATransition* transition = [CATransition animation];
    transition.duration = 1;
    transition.type = kCATransitionFade;
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:pieView animated:NO];
    
}

-(void)tapToPressionePie:(UITapGestureRecognizer*)sender{
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        
        [self setupTheAnimation];
        
    }    
}

@end
