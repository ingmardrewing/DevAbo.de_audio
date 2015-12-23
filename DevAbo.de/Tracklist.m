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
            [[Track alloc] initWithTrackname:@"Synagoge"
                                 andFilename:@"synagoge"
                                 andFiletype:@"mp3"
                                 andLatitude:50.0832f
                                andLongitude:8.2363f ],
            [[Track alloc] initWithTrackname:@"Hinter dem Theater"
                                 andFilename:@"hinterdemtheater"
                                 andFiletype:@"mp3"
                                 andLatitude:50.0830f
                                andLongitude:8.2454f ],
            nil];
    NSLog(@"Tracklist instantiated");
    return self;
}

- (NSURL *) getSoundUrlAtLongitude:(float)longitude_ andLatitiude:(float)latitude_ {
    NSURL *trackUrl;
    for( Track *track in self->tracks){
        if ( [track isNearLatitude:latitude_ andLongitude:longitude_] ) {
            NSString *path = [NSString stringWithFormat:@"%@/%@.%@",
                              [[NSBundle mainBundle] resourcePath],
                              track->filename ,
                              track->filetype ] ;
            trackUrl = [NSURL fileURLWithPath:path] ;
            break;
        }
    }    
    
    return trackUrl;
}

@end