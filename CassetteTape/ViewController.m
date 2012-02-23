//
//  ViewController.m
//  CassetteTape
//
//  Created by Kevin Johnson on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/CATransform3D.h>
#import <QuartzCore/CALayer.h>
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize spoolTop, spoolBottom;


- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration withKey:(NSString*)key
{
    
    CATransform3D rotationTransform = CATransform3DMakeRotation(1.0f * M_PI, 0, 0, 1.0);
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    rotationAnimation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 2; 
    rotationAnimation.delegate = self;
    rotationAnimation.removedOnCompletion = NO;
    
    [image.layer addAnimation:rotationAnimation forKey:key];

}


#define DURATION_TOP 3.0f
#define DURATION_BOTTOM 3.0f
#define SPOOL_TOP_KEY @"top"
#define SPOOL_BOTTOM_KEY @"bottom"

-(void)StartTopSpool
{
    [self rotateImage:self.spoolTop duration:DURATION_TOP withKey:SPOOL_TOP_KEY];
}

-(void)StartBottomSpool
{
    [self rotateImage:self.spoolBottom duration:DURATION_BOTTOM withKey:SPOOL_BOTTOM_KEY];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (play) {
    
        if (anim == [[self.spoolTop layer] animationForKey:SPOOL_TOP_KEY]) {
            [self StartTopSpool];
        }
        else if (anim == [[self.spoolBottom layer] animationForKey:SPOOL_BOTTOM_KEY]) {
            [self StartBottomSpool];
        }
    }
}

-(void)SpinSpool
{
    [self StartTopSpool];
    [self StartBottomSpool];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    play = YES;
    [self SpinSpool];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.spoolTop.layer.cornerRadius = 9.0;
    self.spoolTop.layer.masksToBounds = YES;
    self.spoolTop.layer.borderColor = [UIColor blackColor].CGColor;
    self.spoolTop.layer.borderWidth = 3.0;

    
}

- (void)viewDidUnload
{
    [self setSpoolTop:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;// (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
