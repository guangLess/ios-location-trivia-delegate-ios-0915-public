//
//  FISAddLocationViewController.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation FISAddLocationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.saveButton setEnabled:NO];
    self.nameField.delegate = self;
    //[self.nameField isEditing : YES];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.nameField becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.nameField resignFirstResponder];
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
    [self.delegate addLocationViewController:self didAddLocationNamed:self.nameField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)addLocationTextField:(UITextField *)sender
{
    if (![self.locations containsObject:self.nameField]) {
        [self.saveButton setEnabled:YES];
    }
}

-(IBAction)textFieldEndEditing:(UITextField *)sender
{
    NSLog(@"endEditing");
    //[self.nameField resignFirstResponder];
    //[self.view endEditing:YES];
    //[self.saveButton setEnabled:YES];


}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.nameField)
    {
        [textField resignFirstResponder];
        return YES;
    }
    return NO;
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
