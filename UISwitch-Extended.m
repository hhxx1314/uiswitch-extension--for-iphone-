#import "UISwitch-Extended.h"

#define TAG_OFFSET	900

@implementation UISwitch (tagged)
- (void) spelunkAndTag: (UIView *) aView withCount:(int *) count
{
	for (UIView *subview in [aView subviews])
	{
		if ([subview isKindOfClass:[UILabel class]])
		{
			*count += 1;
			[subview setTag:(TAG_OFFSET + *count)];
		}
		else 
			[self spelunkAndTag:subview withCount:count];
	}
}

+ (UISwitch *) switchWithTag: (NSString *) tag1 andTag: (NSString *) tag2
{
	UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
	
	int labelCount = 0;
	[switchView spelunkAndTag:switchView withCount:&labelCount];
	
	if (labelCount == 2)
	{
		[(UILabel *)[switchView viewWithTag:TAG_OFFSET + 1] setText:tag1];
		[(UILabel *)[switchView viewWithTag:TAG_OFFSET + 2] setText:tag2];
	}
	
	return [switchView autorelease];
}

- (UILabel *) label1 
{ 
	return (UILabel *) [self viewWithTag:TAG_OFFSET + 1]; 
}

- (UILabel *) label2 
{ 
	return (UILabel *) [self viewWithTag:TAG_OFFSET + 2]; 
}

@end


