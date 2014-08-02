//
//  TMDFreeFormLine.m
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDFreeFormLine.h"

@implementation TMDFreeFormLine

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // set up
    }
    
    return self;
}

+ (TMDFreeFormLine *)createLineWithColor:(UIColor *)color lineWidth:(CGFloat)width points:(NSArray *)arrayOfPointsHeldAsNSValue
{
    TMDFreeFormLine *newLine = [[TMDFreeFormLine alloc] init];
    
    newLine.colorOfLine = color;
    newLine.lineWidth = width;
    newLine.arrayOfPointsMakingUpTheLine = arrayOfPointsHeldAsNSValue;
    
    return newLine;
}

@end
