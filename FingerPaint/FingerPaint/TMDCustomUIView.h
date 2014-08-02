//
//  TMDCustomUIView.h
//  FingerPaint
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDCustomUIViewDelegate.h"
#import "TMDViewController.h"
#import "TMDFreeFormLine.h"


@interface TMDCustomUIView : UIView

//@property (assign) id<TMDCustomUIViewDelegate> delegate;
//   don't know why this doesn't work
@property (assign) id delegate;


@end
