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
}

@end
