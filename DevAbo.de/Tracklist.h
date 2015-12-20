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
    Track *track;
}
- (NSURL *) getSoundUrl;
- (id) init;

@end
