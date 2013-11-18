//
//  CTHomePageViewController.m
//  CuociTempo
//
//  Created by Michele Navolio on 18/11/13.
//  Copyright (c) 2013 Michele Navolio. All rights reserved.
//

#import "CTHomePageViewController.h"
#import "CTTypeViewController.h"

@interface CTHomePageViewController ()

@end

@implementation CTHomePageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = self;

    CTTypeViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(CTTypeViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(CTTypeViewController *)viewController index];
    
    index++;
    
    if (index == 3) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}


- (CTTypeViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    CTTypeViewController *childViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TypeView"];
    childViewController.index = index;
    
    switch (index) {
        case 0:
            childViewController.title = @"Pressione";
            break;
        case 1:
            childViewController.title = @"Normale";
            break;
        case 2:
            childViewController.title = @"Microonde";
            break;
        default:
            break;
    }
    
    return childViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


@end
