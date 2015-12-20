//
//  Tracklist.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "Track.h"
#import "Tracklist.h"
#import <Foundation/Foundation.h>

@implementation Tracklist

- (id)init {
    self = [super init];
    
    self->track = [[Track alloc] init];
    self->track->filename = @"test";
    self->track->filetype = @"mp3";

    return self;
}

- (NSURL *) getSoundUrl {
    NSLog(@"view did load");
    NSString *path = [NSString stringWithFormat:@"%@/%@.%@", [[NSBundle mainBundle] resourcePath], self->track->filename, self->track->filetype ];
    NSLog(@"%@ <-path", path );
    return [NSURL fileURLWithPath:path];
}

@end