//
//  DAViewController.m
//  ADBWebBrowserDemo
//
//  Created by Alberto De Bortoli on 10/27/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

#pragma mark - Actions

- (IBAction)launchWebBrowser:(id)sender
{
    ADBWebBrowserViewController *webBrowserViewController =
    [[ADBWebBrowserViewController alloc] initWithURL:[NSURL URLWithString:@"http://google.com"]
                                            delegate:self];
    [self presentModalViewController:webBrowserViewController animated:YES];
}

#pragma mark - ADBWebBrowserViewControllerDelegate

- (void)webBrowserViewControllerDidDismiss:(ADBWebBrowserViewController *)controller
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Web Browser closed"
                                                    message:@"Hope you enjoyed the web surfing!"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Log history", nil];
    [alert show];
}

- (void)webBrowserViewController:(ADBWebBrowserViewController *)controller didRequestURL:(NSURL *)url
{
    if (!_history) {
        _history = [[NSMutableArray alloc] init];
    }
    
    [_history addObject:url];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *historyText = @"";
        
        for (NSURL *url in _history) {
            historyText = [historyText stringByAppendingFormat:@"\n%@", [url absoluteString]];
        }
        
        _historyTextArea.text = historyText;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
