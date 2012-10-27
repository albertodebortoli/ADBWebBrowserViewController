//
//  RootViewController
//  ADBWebBrowserDemo
//
//  Created by Alberto De Bortoli on 10/27/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBWebBrowserViewController.h"

// DAViewController objects are the delegates for ADBWebBrowseViewController objects
// they conform the ADBWebBrowserViewControllerDelegate protocol

@interface RootViewController : UIViewController
<ADBWebBrowserViewControllerDelegate, UIAlertViewDelegate> {
    
    NSMutableArray *_history;
    IBOutlet UITextView *_historyTextArea;
}

- (IBAction)launchWebBrowser:(id)sender;

@end
