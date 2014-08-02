//
//  TMDCustomUIViewDelegate.h
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMDCustomUIView;
#import "TMDCustomUIView.h"

@protocol TMDCustomUIViewDelegate <NSObject>

- (void)tmdCustomUIVView:(TMDCustomUIView *)tmdCustomUIView touchOccurredOverPoints:(NSArray *)arrayOfNSValuesContainingCGPoints;

@end
