//
//  ViewController.m
//  Caculator
//
//  Created by Hoàng Đức on 18/12/2022.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSString *_text;
    NSString *_operator;
    NSInteger _value;
    BOOL _isTyping;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _text = self.displayLabel.text;
    _isTyping = NO;
    
}

- (IBAction)clear:(UIButton*)sender {
    _text = @"0";
    _value = 0;
    self.displayLabel.text = _text;

}

- (IBAction)equal:(UIButton*)sender {
    NSInteger result = 0;
    
    if ([_operator isEqualToString:@"+"]) {
        result = _value + [_text integerValue];
    } else if ([_operator isEqualToString:@"-"]) {
        result = _value - [_text integerValue];
    } else if ([_operator isEqualToString:@"x"]) {
        result = _value * [_text integerValue];
    } else if ([_operator isEqualToString:@"/"]) {
        result = _value / [_text integerValue];
    } else  if ([_operator isEqualToString:@"%"]) {
        result = _value / 100;
    }
    _operator = nil;
    _value = result;
    _isTyping = NO;
    self.displayLabel.text = [NSString stringWithFormat:@"%ld", (long)result];
}

- (IBAction)operation:(UIButton*)sender {
    if (!_operator) {
        _operator = sender.titleLabel.text;
        _isTyping = NO;
    }
    if (!_value) {
        _value = [_text integerValue];
        self.displayLabel.text = _text;
    }

}

- (IBAction)numbers:(UIButton*)sender {
    if (!_isTyping) {
        _text = @"";
        _isTyping = YES;
    }
    _text = [_text stringByAppendingString: sender.titleLabel.text];
    self.displayLabel.text = _text;
}
@end
