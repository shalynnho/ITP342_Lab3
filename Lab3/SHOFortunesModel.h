//
//  SHOFortunesModel.h
//  Lab3
//
//  Created by Shalynn Ho on 2/16/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHOFortunesModel : NSObject

@property (strong, nonatomic) NSString* secretAnswer;

- (NSString *) randomAnswer;
- (NSUInteger) numberOfAnswers;
- (void) removeAnswerAtIndex: (NSUInteger) index;
- (void) insertAnswer: (NSString *) answer
              atIndex: (NSUInteger) index;

@end
