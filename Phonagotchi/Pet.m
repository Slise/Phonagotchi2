//
//  Pet.m
//  Phonagotchi
//
//  Created by Benson Huynh on 2016-01-21.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.grumpy = NO;
    }
    return self;
}

-(void)petMood:(double)velocity {
    if (velocity > 6000) {
        self.grumpy = YES;
    }
}

@end
