//
//  FISAddLocationViewController.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation FISAddLocationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.saveButton setEnabled:NO];
}

-(IBAction)cancelButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(addLocationViewControllerDidCancel:)])
    {
        [self.delegate addLocationViewControllerDidCancel:self];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)saveButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(addLocationViewController:shouldAllowLocationNamed:)])
    {
        [self.delegate addLocationViewController:self didAddLocationNamed:self.nameField.text];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)addLocationTextField:(UITextField *)sender
{
    if (![self.locations containsObject:self.nameField]) {
        [self.saveButton setEnabled:YES];
    }
}

-(BOOL)addLocationViewController:(FISAddLocationViewController *)viewController shouldAllowLocationNamed:(NSString *)locationName{

    return [self.locations containsObject:self.nameField];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}




@end
