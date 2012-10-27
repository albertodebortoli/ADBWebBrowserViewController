//
//  ADBWebBrowserViewController.h
//  ADBWebBrowserViewController
//
//  Created by Alberto De Bortoli on 10/27/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADBWebBrowserViewController;

// the protocol (ADBWebBrowserViewControllerDelegate) that ADBWebBrowserViewController class uses

@protocol ADBWebBrowserViewControllerDelegate <NSObject>
@optional
// delegate method to let the delegating object know that the done button has been pressed
// delegating object *should* implement this method (this method is @optional)
- (void)webBrowserViewControllerDidDismiss:(ADBWebBrowserViewController *)controller;
@required
// delegate method to let the delegating object know that an URL has been requested
// delegating object *must* implement this method, otherwise the app crashes on message sending (this method is @required)
- (void)webBrowserViewController:(ADBWebBrowserViewController *)controller didRequestURL:(NSURL *)url;
@end

// ADBWebBrowserViewController objects are delegates for iVars (instance variables) '_webView'
// and '_addressField', so they must conform to UIWebViewDelegate and UITextFieldDelegate protocol
@interface ADBWebBrowserViewController : UIViewController <UIWebViewDelegate, UITextFieldDelegate> {
    
    UIWebView *_webView;
    UITextField *_addressField;
    NSURL *_urlAddress;
    
    // iVar to track the delegate object
    // usually is the delegate object that set itself as delegate
    // we can't force the delegate object to be of some kind of type (use type id)
    // but we want for sure that it conforms the ADBWebBrowserViewControllerDelegate protocol
    //
    // it means that delegate object says:
    // "Hey ADBWebBrowseViewController object! I'm your delegate, I promise I'll implement the required
    // methods in your ADBWebBrowseViewControllerDelegate protocol and maybe also the optional ones!"
    //
    // i.e. webBrowseViewControllerObject.delegate = self (using the synthesized setter method)
    id <ADBWebBrowserViewControllerDelegate> _delegate;
}

- (id)initWithURL:(NSURL *)aUrlAddress delegate:(id <ADBWebBrowserViewControllerDelegate>)aDelegate;
- (IBAction)doneButtonPress:(id)sender;

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UITextField *addressField;
@property (nonatomic) id <ADBWebBrowserViewControllerDelegate> delegate;
@property (nonatomic, strong) NSURL *urlAddress;

@end
