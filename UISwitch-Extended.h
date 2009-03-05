#import <UIKit/UIKit.h>

@interface UISwitch (tagged)
+ (UISwitch *) switchWithTag: (NSString *) tag1 andTag: (NSString *) tag2;
@property (nonatomic, readonly)	UILabel *label1;
@property (nonatomic, readonly)	UILabel *label2;
@end
