//
//  ViewController.m
//  Caculator
//
//  Created by Hoàng Đức on 18/12/2022.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSString *text;
    NSString *operator;
    float value;
    BOOL isTyping;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    text = self.displayLabel.text;
    isTyping = NO;
    
}

- (IBAction)clear:(UIButton*)sender {
    text = @"0";
    value = 0;
    isTyping = NO;
    self.displayLabel.text = text;

}

- (IBAction)equal:(UIButton*)sender {
    float result = 0;
    
    if ([operator isEqualToString:@"+"]) {
        result = value + [text floatValue];
    } else if ([operator isEqualToString:@"-"]) {
        result = value - [text floatValue];
    } else if ([operator isEqualToString:@"x"]) {
        result = value * [text floatValue];
    } else if ([operator isEqualToString:@"/"]) {
        result = value / [text floatValue];
    } else  if ([operator isEqualToString:@"%"]) {
        result = value / 100;
    }
    operator = nil;
    value = result;
    isTyping = NO;
    self.displayLabel.text = [NSString stringWithFormat:@"%.2f", result];
}

- (IBAction)operation:(UIButton*)sender {
    if (!operator) {
        operator = sender.titleLabel.text;
        isTyping = NO;
    }
    if (!value) {
        value = [text floatValue];
    }

}

- (IBAction)numbers:(UIButton*)sender {
    if (!isTyping) {
        text = @"";
        isTyping = YES;
    }
    text = [text stringByAppendingString: sender.titleLabel.text];
    self.displayLabel.text = text;
}
@end
