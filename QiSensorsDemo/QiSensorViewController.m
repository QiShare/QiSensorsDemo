//
//  QiSensorViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiSensorViewController.h"

@implementation QiSensorViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _textView.contentInset = UIEdgeInsetsMake(15.0, 15.0, 15.0, 15.0);
    _textView.font = [UIFont systemFontOfSize:15.0];
    _textView.editable = NO;
    [self.view addSubview:_textView];
}

- (void)setLatestText:(NSString *)latestText {
    
    _latestText = latestText;
    
    _textView.text = [NSString stringWithFormat:@"%@\n\n%@", latestText, _textView.text];
    
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"%@", latestText);
    });
}

@end
