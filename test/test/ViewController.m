//
//  ViewController.m
//  test
//
//  Created by Daniele Ceglia on 21/05/14.
//  Copyright (c) 2014 Relifeit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wv;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"carousel/index" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:htmlFile];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.wv loadRequest:urlRequest];
    
    self.wv.scrollView.bounces = NO;
    self.wv.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.wv stringByEvaluatingJavaScriptFromString:@"document. body.style.zoom = 2.0;"];
}

#pragma mark - UIScrollViewDelegate

-(UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView
{
    return nil;
}

@end
