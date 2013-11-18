//
//  CTPieViewController.h
//  CuociTempo
//
//  Created by Michele Navolio on 18/11/13.
//  Copyright (c) 2013 Michele Navolio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"
#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface CTPieViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource>

@property (strong, nonatomic) IBOutlet XYPieChart *pieChartRight;
@property (strong, nonatomic) IBOutlet UILabel *selectedSliceLabel;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;
@property (nonatomic,strong)NSArray *fetchObject;
@end

