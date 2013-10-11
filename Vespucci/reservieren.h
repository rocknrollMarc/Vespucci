//
//  reservieren.h
//  Vespucci
//
//  Created by Marc Blümner on 03.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface reservieren : UIViewController
<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *leute;
@property (strong, nonatomic) IBOutlet UIDatePicker *datum;

- (IBAction)reservierungsMailVerschicken:(id)sender;
- (IBAction)removeKeyboardOnPressingReturn:(id)sender;

@end
