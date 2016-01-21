//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) Pet *petObject;
@property (nonatomic) UIImageView *appleView;
@property (nonatomic) UIImageView *bucketView;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Pet *petObject1 = [[Pet alloc] init];
    self.petObject = petObject1;
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.petImageView.image = [UIImage imageNamed:@"default"];
    [self.view addSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.appleView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleView.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleView.image = [UIImage imageNamed:@"apple"];
    [self.view insertSubview:self.appleView aboveSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.appleView
                                                          attribute:NSLayoutAttributeLeadingMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeadingMargin
                                                         multiplier:1.0
                                                           constant:20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.appleView
                                                          attribute:NSLayoutAttributeBottomMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottomMargin
                                                         multiplier:1.0
                                                           constant:-65.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.appleView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.appleView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0f]];
    
    self.bucketView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bucketView.image = [UIImage imageNamed:@"bucket"];
    [self.view insertSubview:self.bucketView aboveSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketView
                                                          attribute:NSLayoutAttributeLeadingMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeadingMargin
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketView
                                                          attribute:NSLayoutAttributeBottomMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottomMargin
                                                         multiplier:1.0
                                                           constant:-30.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:120.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:120.0f]];
}

- (IBAction)pettingPan:(UIPanGestureRecognizer*)sender {
    CGPoint vector = [sender velocityInView:self.view];
    double velocity = sqrt((vector.x * vector.x) + (vector.y * vector.y));
    NSLog(@"%f", velocity);
    [self.petObject petMood:velocity];
    if  (self.petObject.grumpy){
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.petImageView.image = [UIImage imageNamed:@"default"];
        });
    }
}

- (IBAction)pinchObject:(id)sender {
    
}

@end
