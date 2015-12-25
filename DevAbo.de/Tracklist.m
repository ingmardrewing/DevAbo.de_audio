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
    self->tracks = [NSMutableArray new];
    [self readTrackList];
    return self;
}

- (void)readTrackList {
    NSString *trackListPath = [[NSBundle mainBundle] pathForResource:@"tracklist" ofType:@"plist"];
    NSArray *tracklistarray = [[NSArray alloc] initWithContentsOfFile: trackListPath ];
    
    for (id track in tracklistarray) {
        [self addTrackFromPlist:track];
    }
}

- (void)addTrackFromPlist:(id)track {
    float lat = [[track valueForKey:  @"latitude"] floatValue];
    float lon = [[track valueForKey:  @"longitude"] floatValue];
    self->tracks
        = [self->tracks arrayByAddingObject:
           [ [Track alloc] initWithTrackname: [track objectForKey: @"name"]
                                andFilename: [track objectForKey: @"filename"]
                                andFiletype: [track objectForKey: @"filetype"]
                                andLatitude: lat
                               andLongitude: lon]
           ];
}

- (NSURL *)getSoundUrlFor:(Track *) track {
    NSString *path = [NSString stringWithFormat:@"%@/%@.%@",
                      [[NSBundle mainBundle] resourcePath],
                      track->filename ,
                      track->filetype ] ;
    return [NSURL fileURLWithPath:path] ;
}

- (NSURL *) getSoundUrlAtLongitude:(float) longitude_ andLatitiude: (float) latitude_ {
    for( Track *track in self->tracks){
        if ( [track isNearLatitude:latitude_ andLongitude:longitude_] ) {
            return [self getSoundUrlFor:track];
        }
    }    
    return NULL;
}

@end