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


- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration 
{
    
    CATransform3D rotationTransform = CATransform3DMakeRotation(1.0f * M_PI, 0, 0, 1.0);
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    rotationAnimation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 2; 
    rotationAnimation.delegate = self;
    
    [image.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

}

#define DURATION 3.0f

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	if (play && flag) {
        [self rotateImage:self.spoolTop duration:DURATION];
        [self rotateImage:self.spoolBottom duration:DURATION];
    }
}

-(void)SpinSpool
{
    [self rotateImage:self.spoolTop duration:DURATION];
    [self rotateImage:self.spoolBottom duration:DURATION];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    play = YES;
    [self SpinSpool];
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
