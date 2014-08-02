//
//  TMDCustomUIView.m
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDCustomUIView.h"


@interface TMDCustomUIView ()

//@property CGPoint approximateInitialTouchLocation;
@property (strong, nonatomic) NSMutableArray *touchPoints;



@end

@implementation TMDCustomUIView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // custom set up
        
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    self.touchPoints = [[NSMutableArray alloc] init];
    [self.touchPoints addObject:[NSValue valueWithCGPoint:touchLocation]];
    
    //self.approximateInitialTouchLocation = touchLocation;
    
    //[self handleTouchAtLocation:touchLocation];
    
    NSLog(@"touchesBegan... at CGPoint x: %f   y: %f ", touchLocation.x, touchLocation.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    //[self handleTouchAtLocation:touchLocation];
    
    if (self.touchPoints) {
        [self.touchPoints addObject:[NSValue valueWithCGPoint:touchLocation]];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //[self.delegate rateView:self ratingDidChange:self.rating];
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    [self.touchPoints addObject:[NSValue valueWithCGPoint:touchLocation]];
    
    NSLog(@"touchesEnded... at CGPoint x: %f   y: %f ", touchLocation.x, touchLocation.y);
    
    [self.delegate tmdCustomUIVView:self touchOccurredOverPoints:self.touchPoints];
    
}

- (void)drawRect:(CGRect)rect
{
//    NSLog(@"drawRect getting called...");
//    
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
//    
//    // Set the starting point of the shape.
//    [aPath moveToPoint:CGPointMake(50.0, 0.0)];
//    
//    // Draw the lines.
//    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
//    [aPath addLineToPoint:CGPointMake(160, 140)];
//    [aPath addLineToPoint:CGPointMake(40.0, 140)];
//    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
//    [aPath closePath];
//    
//    
//    
//    // Create an oval shape to draw.
//    aPath = [UIBezierPath bezierPathWithOvalInRect:
//                           CGRectMake(0, 0, 200, 100)];
//    
//    // Set the render colors.
//    [[UIColor blackColor] setStroke];
//    [[UIColor redColor] setFill];
//    
//    CGContextRef aRef = UIGraphicsGetCurrentContext();
//    
//    // If you have content to draw after the shape,
//    // save the current state before changing the transform.
//    CGContextSaveGState(aRef);
//    
//    // Adjust the view's origin temporarily. The oval is
//    // now drawn relative to the new origin point.
//    CGContextTranslateCTM(aRef, 50, 50);
//    
//    // Adjust the drawing options as needed.
//    aPath.lineWidth = 5;
//    
//    // Fill the path before stroking it so that the fill
//    // color does not obscure the stroked line.
//    //[aPath fill];
//    [aPath stroke];
//    
//    // Restore the graphics state before drawing any other content.
//    //CGContextRestoreGState(aRef);
    
    for (int count = 0; count < ((TMDViewController *) self.delegate).linesDrawnByUser.count; count++) {
        UIBezierPath *path = [[UIBezierPath alloc] init];
        
        NSArray *pointsMakingUpLine = ((TMDFreeFormLine *)((TMDViewController *) self.delegate).linesDrawnByUser[count]).arrayOfPointsMakingUpTheLine;
        
        for (int i = 0; i < pointsMakingUpLine.count; i++) {
            if (i == 0) {
                [path moveToPoint:[(NSValue *)pointsMakingUpLine[i] CGPointValue]];
            } else {
                [path addLineToPoint:[(NSValue *)pointsMakingUpLine[i] CGPointValue]];
            }
        }
        //[((TMDFreeFormLine *)((TMDViewController *) self.delegate).linesDrawnByUser).colorOfLine setStroke];
        
        UIColor *color = ((TMDFreeFormLine *)((TMDViewController *) self.delegate).linesDrawnByUser[count]).colorOfLine;
        
        path.lineWidth = ((TMDFreeFormLine *)((TMDViewController *) self.delegate).linesDrawnByUser[count]).lineWidth;
                          
        [color setStroke];
                          
        [path stroke];
    }
    
    
    
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    [path moveToPoint:CGPointMake(75, 10)];
//    [path addLineToPoint:CGPointMake(160, 150)];
//    [path addLineToPoint:CGPointMake(10, 150)];
//    
//    [[UIColor redColor] setStroke];
//    [path stroke];
    
    
}

@end
