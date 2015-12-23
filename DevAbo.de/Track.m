//
//  Track.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "Track.h"
#import <Foundation/Foundation.h>
#import <math.h>

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
    float delta_lat = fabsf( self->latitude - latitude_ );
    float delta_lon = fabsf( self->longitude - longitude_ );
    NSLog(@"comparing to %@  delta_lat: %f, detla_lon: %f ...", self->trackname, delta_lat, delta_lon );

    bool close_enough = delta_lat < 0.0001f && delta_lon < 0.0001f;
    if ( close_enough && self->unplayed ){
        NSLog(@"we found a place ..");
        self->unplayed = NO;
        return YES;
    }
    else if ( ! close_enough && ! self->unplayed ) {
        self->unplayed = YES;
    }
    NSLog(@"no match");
    return NO;
}

@end