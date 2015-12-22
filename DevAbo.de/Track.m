//
//  Track.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "Track.h"
#import <Foundation/Foundation.h>

@implementation Track

- (id) initWithTrackname:(NSString *)trackname_
             andFilename:(NSString *)filename_
             andFiletype:(NSString *)filetype_
             andLatitude:(float)latitude_
            andLongitude:(float)longitude_ {
    self->trackname = trackname_;
    self->filename = filename_;
    self->filetype = filetype_;
    self->latitude = latitude_;
    self->longitude = longitude_;
    self->unplayed = YES;
    return self;
}

- (BOOL) isNearLatitude:(float)latitude_ andLongitude:(float)longitude_ {
    NSLog(@"comparing to %@ ...", self->trackname );
    float delta_lat = self->latitude - latitude_;
    float delta_lon = self->longitude - longitude_;
    if (delta_lat < 0.00005f && delta_lon < 0.00005f && self->unplayed ){
        NSLog(@"we found a place ..");
        self->unplayed = NO;
        return YES;
    }
    NSLog(@"no match");
    return NO;
}

@end