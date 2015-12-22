//
//  Track.h
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject {
    @public float longitude;
    @public float latitude;
    @public NSString *filename;
    @public NSString *filetype;
    @public NSString *trackname;
    @public BOOL unplayed;
}

- (id) initWithTrackname: (NSString *) trackname_
             andFilename: (NSString *) filename_
             andFiletype: (NSString *) filetype_
             andLatitude: (float) latitude_
            andLongitude: (float) longitude;

- (BOOL) isNearLatitude: (float) latitude_ andLongitude: (float) longitude_;

@end
