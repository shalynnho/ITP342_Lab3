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
        self.secretAnswer = [[NSString alloc] initWithFormat:@"This is the secret answer."];
        self.answers = [[NSMutableArray alloc] initWithObjects:@"Answer1", @"Answer2", @"Answer3", nil];
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

- (void) removeAnswerAtIndex: (NSUInteger) index
{
    if (index < [self.answers count]) {
        [self.answers removeObjectAtIndex: index];
    } else {
        NSLog(@"Error: removeAnswerAtIndex :: index out of bounds.");
    }
}

- (void) insertAnswer: (NSString *) answer
              atIndex: (NSUInteger) index
{
    if (index < [self.answers count]) {
        [self.answers insertObject:answer atIndex:index];
    }
}

@end
