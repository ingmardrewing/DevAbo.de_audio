//
//  ViewController.h
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import AVFoundation;

@interface ViewController : UIViewController <CLLocationManagerDelegate>

- (void) setForeground;
- (void) setBackground;
- (void) logWithString: (NSString *) string;

@property (weak, nonatomic) IBOutlet UITextView *textfield;

@end

