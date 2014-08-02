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

@property (strong, nonatomic) NSArray *supportedColors;


@property (strong, nonatomic) UIColor *currentlySelectedColor;
@property CGFloat currentlySelectedLineWidth;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.customView.delegate = self;
    
    self.supportedColors = @[[UIColor greenColor], [UIColor redColor], [UIColor blueColor], [UIColor blackColor], [UIColor orangeColor]];
    
    self.linesDrawnByUser = [[NSMutableArray alloc] init];
    
    self.currentlySelectedColor = [UIColor greenColor];
    self.currentlySelectedLineWidth = 4.0;
    
    self.colorSwatchView.backgroundColor = self.currentlySelectedColor;
    
    self.colorStepper.minimumValue = 0.0;
    self.colorStepper.stepValue = 1.0;
    self.colorStepper.maximumValue = (double)(self.supportedColors.count - 1);
    
    self.changeLineWidthStepper.minimumValue = 1.0;
    self.changeLineWidthStepper.maximumValue = 10.0;
    self.changeLineWidthStepper.stepValue = 1.0;
    self.changeLineWidthStepper.value = self.currentlySelectedLineWidth;
    
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

- (IBAction)changeColorSwatch:(id)sender
{
    self.currentlySelectedColor = [self.supportedColors objectAtIndex:(NSInteger)self.colorStepper.value];
    self.colorSwatchView.backgroundColor = self.currentlySelectedColor;
}

- (IBAction)changeLineWidth:(id)sender
{
    self.currentlySelectedLineWidth = self.changeLineWidthStepper.value;
    self.lineWidthLabel.text = [NSString stringWithFormat:@"%.1f pts", self.currentlySelectedLineWidth];
}
@end
