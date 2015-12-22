//
//  Tracklist.h
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "Track.h"
#import <Foundation/Foundation.h>

@interface Tracklist : NSObject {
    NSArray *tracks;
}

- (id) init;
- (NSURL *) getSoundUrlAtLongitude: (float) longitude_ andLatitiude: (float) latitude_;

@end
