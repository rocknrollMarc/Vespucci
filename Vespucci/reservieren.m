//
//  reservieren.m
//  Vespucci
//
//  Created by Marc Blümner on 03.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "reservieren.h"

@implementation reservieren
@synthesize name = _name;
@synthesize leute = _leute;
@synthesize datum = _datum;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDate *now = [NSDate date];
    [_datum setDate:now];
}

- (void)viewDidUnload
{
    [self setName:nil];
    [self setLeute:nil];
    [self setDatum:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(IBAction)reservierungsMailVerschicken:(id)sender
{
    NSDate* selected = [_datum date];
    
    NSString* theMessage = [NSString stringWithFormat:@"Sehr geehrte Damen und Herren mein name ist %@ und ich möchte am %@ für %@ personen einen Tisch reservieren", self.name.text ,selected, self.leute.text ];
                            
    
    NSLog(@"%@", theMessage);
    NSLog(@"Email button tapped!");
    
    if ([MFMailComposeViewController canSendMail ])
    {
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc]init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Reservierung!!!"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
        
    }
}

- (IBAction)removeKeyboardOnPressingReturn:(id)sender 
{
    [self.name resignFirstResponder];
    [self.leute resignFirstResponder];
    [self.datum resignFirstResponder];
}

#pragma mark
#pragma mark mail composer delegate method

-(void)mailComposeController:(MFMailComposeViewController *)controller 
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;
{
    [self dismissModalViewControllerAnimated:YES];
}


@end
