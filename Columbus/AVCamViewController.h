
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface AVCamViewController : UIViewController<UITextFieldDelegate>{
    IBOutlet UITextField* captionTextField;
    IBOutlet UIImageView* topBar, *bottomBar;
}
- (UIImage *)imageRotatedByDegrees:(UIImage*)oldImage deg:(CGFloat)degrees;
@end
