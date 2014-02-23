//
//  SHOFortunesModel.m
//  Lab3
//
//  Created by Shalynn Ho on 2/16/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "SHOFortunesModel.h"

@interface SHOFortunesModel()

@property (strong, nonatomic) NSMutableArray* answers;

@end

@implementation SHOFortunesModel

- (id)init
{
    self = [super init];
    if (self) {
        self.secretAnswer = [[NSString alloc] initWithFormat:@"The best thing you can be is happy."];
        self.answers = [[NSMutableArray alloc] initWithObjects:
                        @"You will become a crazy cat person.",
                        @"Work hard, it will be worth it.",
                        @"It's never too late.",
                        @"Every day is a new day.",
                        @"Hug a fuzzy cat!",
                        @"Lucky number 19!",
                        @"Live for the moment",
                        @"Smile like you mean it.",
                        @"Do something nice for someone everyday.",
                        @"I believe you can fly."
                        @"Watch cat videos. :)",
                        @"Pay every kind act forward.",
                        @"Laugh daily, live longer.", nil];
    }
    return self;
}

- (NSString *) randomAnswer
{
    return [self.answers objectAtIndex:random() % [self.answers count]];
}

- (NSUInteger) numberOfAnswers
{
    return [self.answers count];
}

- (NSString *) answerAtIndex: (NSUInteger) index
{
    if (index < [self numberOfAnswers]) {
        return (NSString*)[self.answers objectAtIndex:index];
    } else {
        NSLog(@"Error: answerAtIndex :: index out of bounds.");
        return nil;
    }
}

- (void) removeAnswerAtIndex: (NSUInteger) index
{
    if (index < [self numberOfAnswers]) {
        [self.answers removeObjectAtIndex: index];
    } else {
        NSLog(@"Error: removeAnswerAtIndex :: index out of bounds.");
    }
}

- (void) insertAnswer: (NSString *) answer
              atIndex: (NSUInteger) index
{
    if (index < [self numberOfAnswers]) {
        [self.answers insertObject:answer atIndex:index];
    } else {
        NSLog(@"Error: insertAnswerAtIndex :: index out of bounds.");
    }
}

@end
