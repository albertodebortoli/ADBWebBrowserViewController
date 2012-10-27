//
//  ADBWebBrowserViewController.m
//  ADBWebBrowserViewController
//
//  Created by Alberto De Bortoli on 10/27/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "ADBWebBrowserViewController.h"
#import "MBProgressHUD.h"

@implementation ADBWebBrowserViewController

#pragma mark - View lifecycle

- (id)initWithURL:(NSURL *)aUrlAddress delegate:(id <ADBWebBrowserViewControllerDelegate>)aDelegate
{
    // since this app is 'Universal' it will run both on iPhone and iPad
    // we have different xib files based on the device the app runs
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"ADBWebBrowserViewController_iPhone" bundle:nil];
    } else {
        self = [super initWithNibName:@"ADBWebBrowserViewController_iPad" bundle:nil];
    }
        
    if (self) {
        _delegate = aDelegate;
        _urlAddress = aUrlAddress;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addressField.text = [self.urlAddress absoluteString]; 
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // the first load request is done in the 'viewDidAppear'
    // the view is ready to use only when 'viewDidLoad' has been called.
    // before that moment we could not access our webView
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.urlAddress]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Actions

- (IBAction)doneButtonPress:(id)sender
{
    // since the 'webBrowserViewControllerDidDismiss:' delegate method (called selector,
    // as all the mothods in Objective-C) is marked as @optional, we have to check that
    // it has been implemented by the delegate class!
    // without the check, the app could crash
    if ([self.delegate respondsToSelector:@selector(webBrowserViewControllerDidDismiss:)]) {
        [self.delegate webBrowserViewControllerDidDismiss:self];
    }
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    
    // since the 'webBrowserViewController:didRequestURL:' delegate method is marked as
    // @required, we are sure that the delegate class implements it
    [self.delegate webBrowserViewController:self didRequestURL:self.urlAddress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView:self.webView animated:YES];
    self.addressField.text = [[self.webView.request URL] absoluteString];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideAllHUDsForView:self.webView animated:YES];
    self.addressField.text = [[self.webView.request URL] absoluteString];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.urlAddress = [NSURL URLWithString:textField.text];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.urlAddress]];
    [textField resignFirstResponder];
    return YES;
}

@end
