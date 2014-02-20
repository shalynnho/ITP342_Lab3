//
//  SHOViewController.m
//  Lab3
//
//  Created by Shalynn Ho on 2/16/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "SHOViewController.h"

@interface SHOViewController ()

@property (strong,nonatomic) SHOFortunesModel *model;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation SHOViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.model = [[SHOFortunesModel alloc] init];
    
    // add single/double tap gesture recognizers
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    // only recognize single taps if they are not the first of two taps
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    // testing add/remove
    NSLog(@"BEGIN TEST :: Number of answers: %d", [self.model numberOfAnswers]);
    NSLog(@">> Removing at index 2");
    [self.model removeAnswerAtIndex:2];
    NSLog(@"Number of answers: %d", [self.model numberOfAnswers]);
    NSLog(@">> Inserting at index 1");
    [self.model insertAnswer:@"Inserted answer!" atIndex:1];
    NSLog(@"END TEST :: Number of answers: %d", [self.model numberOfAnswers]);
}

- (void) displayAnswer: (NSString*) answer {
    [UIView animateWithDuration:1.0
        animations:^{
            self.answerLabel.alpha = 0; // transparent
        }
        completion:^(BOOL finished){
            [self animateAnswer:answer];
        }
     ];
}

- (void) animateAnswer: (NSString *) answer {
    [UIView animateWithDuration:1.0 animations:^ {
        // set answer
        self.answerLabel.text = answer;
        // if black, set to red
        if (self.answerLabel.textColor == UIColor.blackColor) {
            self.answerLabel.textColor = [UIColor colorWithRed:(153.0f/255.0f) green:0.0 blue:0.0 alpha:1.0];
        } else { // red, set black
            self.answerLabel.textColor = UIColor.blackColor;
        }
        // fade in
        self.answerLabel.alpha = 1; // opaque
        }
     ];
}

- (void) singleTapRecognized: (UITapGestureRecognizer*) recognizer {
    [self displayAnswer:[self.model randomAnswer]];
}

- (void) doubleTapRecognized: (UITapGestureRecognizer*) recognizer {
    [self displayAnswer:[self.model secretAnswer]];
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"You shook me!");
        [self displayAnswer:[self.model randomAnswer]];
    }
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
