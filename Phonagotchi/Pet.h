//
//  Pet.h
//  Phonagotchi
//
//  Created by Benson Huynh on 2016-01-21.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, readwrite) BOOL grumpy;

-(void) petMood: (double) velocity;

@end
