//
//  EGOTextView_DemoViewController.m
//  EGOTextView_Demo
//
//  Created by Devin Doty on 4/18/11.
//  Copyright 2011 enormego. All rights reserved.
//

#import "EGOTextView_DemoViewController.h"
#import "EGOTextView.h"

#import <QuartzCore/QuartzCore.h>

@implementation EGOTextView_DemoViewController

#pragma mark -
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"UITextView", @"EGOTextView"]];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    
    if (!_textView) {
        
        UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        textView.font = self.egoTextView.font;
        [self.view addSubview:textView];
        self.textView = textView;
        
    }
    
    if (!_egoTextView) {
        
        EGOTextView *view = [[EGOTextView alloc] initWithFrame:self.view.bounds];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        view.delegate = (id<EGOTextViewDelegate>)self;
        [self.view addSubview:view];
        self.egoTextView = view;
        self.egoTextView.text = @"Sheeeiiit it's attributed!";
        [view becomeFirstResponder];
        
    }
     
    [segment setSelectedSegmentIndex:1];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark Actions

- (void)segmentChanged:(UISegmentedControl*)sender {
    
    if (sender.selectedSegmentIndex == 0) {
    
        self.egoTextView.hidden = YES;
        self.textView.hidden = NO;
        [self.textView becomeFirstResponder];
        
    } else {
                
        self.textView.hidden = YES;
        self.egoTextView.hidden = NO;
        [self.egoTextView becomeFirstResponder];
        
    }
    
}


#pragma mark -
#pragma mark EGOTextViewDelegate

- (BOOL)egoTextViewShouldBeginEditing:(EGOTextView *)textView {
    return YES;
}

- (BOOL)egoTextViewShouldEndEditing:(EGOTextView *)textView {
    return YES;
}

- (void)egoTextViewDidBeginEditing:(EGOTextView *)textView {
}

- (void)egoTextViewDidEndEditing:(EGOTextView *)textView {
}

- (void)egoTextViewDidChange:(EGOTextView *)textView {

}

- (void)egoTextView:(EGOTextView*)textView didSelectURL:(NSURL *)URL {
        
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    _textView=nil;
    _egoTextView=nil;
}

- (void)dealloc {
    _textView=nil;
    _egoTextView=nil;
}


@end
