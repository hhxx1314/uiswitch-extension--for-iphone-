#import <UIKit/UIKit.h>
#import "UISwitch-Extended.h"

@interface TestBedController : UIViewController
@end

@implementation TestBedController

- (void)loadView
{
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view = contentView;
	contentView.backgroundColor = [UIColor whiteColor];
	
	// Standard ON/OFF
	UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
	switchView.center = CGPointMake(160.0f, 20.0f);
	switchView.on = YES;
	[contentView addSubview:switchView];
	[switchView release];
	
	// Custom YES/NO
	switchView = [UISwitch switchWithLeftText:@"YES" andRight:@"NO"];
	switchView.center = CGPointMake(160.0f, 60.0f);
	switchView.on = YES;
	[contentView addSubview:switchView];
	
	// Custom font and color
	switchView = [UISwitch switchWithLeftText:@"Hello " andRight:@"ABC "];
	switchView.center = CGPointMake(160.0f, 100.0f);
	switchView.on = YES;
	[switchView.label1 setFont:[UIFont boldSystemFontOfSize:13.0f]];
	[switchView.label2 setFont:[UIFont italicSystemFontOfSize:15.0f]];
	[switchView.label2 setTextColor:[UIColor blueColor]];
	[contentView addSubview:switchView];
	
	// Multiple lines
	switchView = [UISwitch switchWithLeftText:@"Hello\nWorld" andRight:@"Bye\nWorld"];
	switchView.center = CGPointMake(160.0f, 140.0f);
	switchView.on = YES;
	[switchView.label1 setFont:[UIFont boldSystemFontOfSize:11.0f]];
	[switchView.label2 setFont:[UIFont boldSystemFontOfSize:11.0f]];
	[switchView.label1 setNumberOfLines:2];
	[switchView.label2 setNumberOfLines:2];
	[contentView addSubview:switchView];
	
	[contentView release];
}
@end


@interface TestBedAppDelegate : NSObject <UIApplicationDelegate>
@end

@implementation TestBedAppDelegate
- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	TestBedController *tbc = [[TestBedController alloc] init];
	[window addSubview:tbc.view];
	[window makeKeyAndVisible];
}
@end

int main(int argc, char *argv[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	int retVal = UIApplicationMain(argc, argv, nil, @"TestBedAppDelegate");
	[pool release];
	return retVal;
}
