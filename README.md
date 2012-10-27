ADBWebBrowserViewController
===========================

A simple web browser view controller.
It uses a toolbar with textfield (for the address), refresh, stop and close buttons. 

Useful for understanding basic iOS programming and delegation pattern.

Try out the included demo project.

Simple usage:

- copy ADBWebBrowserViewController class into your project (including xib files)
- import `ADBWebBrowserViewController.h` in your class
- create an `ADBWebBrowserViewController` object using the designated initializer `initWithURL:delegate:`
- use delegation pattern implementing `ADBWebBrowserViewControllerDelegate` protocol and related required delegate method

``` objective-c
#pragma mark - ADBWebBrowserViewControllerDelegate
- (void)webBrowserViewController:(ADBWebBrowserViewController *)controller
                   didRequestURL:(NSURL *)url { ... }
```

- and optional delegate method

``` objective-c
- (void)webBrowserViewControllerDidDismiss:(ADBWebBrowserViewController *)controller { ... }
```

![1](http://www.albertodebortoli.it/GitHub/ADBWebBrowserViewController/01.png)

# License

Licensed under the New BSD License.

Copyright (c) 2012, Alberto De Bortoli
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Alberto De Bortoli nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Alberto De Bortoli BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Resources

Info can be found on [my website](http://www.albertodebortoli.it), [and on Twitter](http://twitter.com/albertodebo).