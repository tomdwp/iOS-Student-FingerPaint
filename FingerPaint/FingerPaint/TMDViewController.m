//
//  TMDViewController.m
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDViewController.h"


@interface TMDViewController ()

@property (weak, nonatomic) IBOutlet TMDCustomUIView *customView;




@property (strong, nonatomic) UIColor *currentlySelectedColor;
@property CGFloat currentlySelectedLineWidth;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.customView.delegate = self;
    
    self.linesDrawnByUser = [[NSMutableArray alloc] init];
    
    self.currentlySelectedColor = [UIColor greenColor];
    self.currentlySelectedLineWidth = 4.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TMDCustomUIViewDelegate methods

- (void)tmdCustomUIVView:(TMDCustomUIView *)tmdCustomUIView touchOccurredOverPoints:(NSArray *)arrayOfNSValuesContainingCGPoints
{
    [self.linesDrawnByUser addObject:[TMDFreeFormLine createLineWithColor:self.currentlySelectedColor lineWidth:self.currentlySelectedLineWidth points:arrayOfNSValuesContainingCGPoints]];
    
    [tmdCustomUIView setNeedsDisplay];
}

@end
