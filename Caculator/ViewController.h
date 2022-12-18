//
//  ViewController.h
//  Caculator
//
//  Created by Hoàng Đức on 18/12/2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)numbers:(UIButton*)sender;

- (IBAction)operation:(UIButton*)sender;

- (IBAction)equal:(UIButton*)sender;

- (IBAction)clear:(UIButton*)sender;



@end

