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
    self->tracks = [
        [NSArray alloc] initWithObjects:
            [[Track alloc] initWithTrackname:@"Marktkirche"
                                 andFilename:@"marktkirche"
                                 andFiletype:@"mp3"
                                 andLatitude:50.08228f
                                andLongitude:8.24056f ],
            [[Track alloc] initWithTrackname:@"Schulberg"
                                 andFilename:@"schulberg"
                                 andFiletype:@"mp3"
                                 andLatitude:50.0835f
                                andLongitude:8.2372f ],
            [[Track alloc] initWithTrackname:@"Platz der deutschen Einheit"
                                 andFilename:@"platzderdeutscheneinheit"
                                 andFiletype:@"mp3"
                                 andLatitude:50.0807f
                                andLongitude:8.2360f ],
            [[Track alloc] initWithTrackname:@"Luisenplatz"
                                 andFilename:@"luisenplatz"
                                 andFiletype:@"mp3"
                                 andLatitude:50.0790f
                                andLongitude:8.2392f ],
            nil];
    return self;
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