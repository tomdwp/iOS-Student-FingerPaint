//
//  TMDViewController.h
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDCustomUIViewDelegate.h"
#import "TMDFreeFormLine.h"

@class TMDCustomUIView;


@interface TMDViewController : UIViewController <TMDCustomUIViewDelegate>

@property (strong, nonatomic) NSMutableArray *linesDrawnByUser;
@property (weak, nonatomic) IBOutlet UIStepper *colorStepper;
@property (weak, nonatomic) IBOutlet UIView *colorSwatchView;

@property (weak, nonatomic) IBOutlet UILabel *lineWidthLabel;
@property (weak, nonatomic) IBOutlet UIStepper *changeLineWidthStepper;

- (IBAction)changeColorSwatch:(id)sender;
- (IBAction)changeLineWidth:(id)sender;



@end
