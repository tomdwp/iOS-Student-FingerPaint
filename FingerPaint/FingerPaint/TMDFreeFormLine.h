//
//  TMDFreeFormLine.h
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDFreeFormLine : NSObject

@property (strong, nonatomic) UIColor *colorOfLine;
@property CGFloat lineWidth;

//each CGPoint held as NSValue inside the array
@property (strong, nonatomic) NSArray *arrayOfPointsMakingUpTheLine;

+ (TMDFreeFormLine *)createLineWithColor:(UIColor *)color lineWidth:(CGFloat)width points:(NSArray *)arrayOfPointsHeldAsNSValue;

@end
