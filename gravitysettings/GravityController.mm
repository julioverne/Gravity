#import <vector>
#import <notify.h>
#import <Social/Social.h>
#import "prefs.h"

#define PLIST_PATH_Settings "/var/mobile/Library/Preferences/com.julioverne.gravity.plist"

@interface GravityController : PSListController {
	UILabel* _label;
	UILabel* underLabel;
}
- (void)HeaderCell;
@end


@implementation GravityController
- (id)specifiers {
	if (!_specifiers) {
		NSMutableArray* specifiers = [NSMutableArray array];
		PSSpecifier* spec;
		spec = [PSSpecifier preferenceSpecifierNamed:@"Enabled"
                                                  target:self
											         set:@selector(setPreferenceValue:specifier:)
											         get:@selector(readPreferenceValue:)
                                                  detail:Nil
											        cell:PSSwitchCell
											        edit:Nil];
		[spec setProperty:@"Enabled" forKey:@"key"];
		[spec setProperty:@YES forKey:@"default"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Active Automatically"
                                                  target:self
											         set:@selector(setPreferenceValue:specifier:)
											         get:@selector(readPreferenceValue:)
                                                  detail:Nil
											        cell:PSSwitchCell
											        edit:Nil];
		[spec setProperty:@"ActiveAutomatically" forKey:@"key"];
		[spec setProperty:@YES forKey:@"default"];
		//[spec setProperty:@(NO) forKey: @"enabled"]; //Beta test
        [specifiers addObject:spec];
		
		
		spec = [PSSpecifier emptyGroupSpecifier];
        [specifiers addObject:spec];
		
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Include Dock"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"UseInDock" forKey:@"key"];
		[spec setProperty:@YES forKey:@"default"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Allow Launching Apps"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"AllowTapIcon" forKey:@"key"];
		[spec setProperty:@YES forKey:@"default"];
		[spec setProperty:@YES forKey:@"UpdateAppCell"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Override Home Button"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"HomeButtonTap" forKey:@"key"];
		[spec setProperty:@NO forKey:@"default"];
		[spec setProperty:@YES forKey:@"HomeButtonTapCell"];
		[spec setProperty:@([[self readPreferenceValue:[specifiers lastObject]] boolValue]) forKey: @"enabled"];
		if (access("/usr/lib/libactivator.dylib", F_OK) == 0) {
			[spec setProperty:@NO forKey: @"enabled"];
		}
        [specifiers addObject:spec];
		
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Icon Rotation"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"AllowsRotation" forKey:@"key"];
		[spec setProperty:@YES forKey:@"default"];
        [specifiers addObject:spec];		
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Hide Label"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"HideLabelIcon" forKey:@"key"];
		[spec setProperty:@NO forKey:@"default"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Bounciness"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Bounciness" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Bounciness"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"Bounce" forKey:@"key"];
		[spec setProperty:@(0.5) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@2 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Friction"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Friction" forKey:@"label"];
        [specifiers addObject:spec];		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Friction"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"Friction" forKey:@"key"];
		[spec setProperty:@(0.5) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@2 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Angular Resistance"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Angular Resistance" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Angular Resistance"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"AngularResistance" forKey:@"key"];
		[spec setProperty:@(0) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@200 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Speed Slow"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Speed" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Speed Slow"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"Speed" forKey:@"key"];
		[spec setProperty:@(5.0) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@15 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Effect Gravity"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Effect Gravity" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Gravity Force"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"GravityForce" forKey:@"key"];
		[spec setProperty:@(1.0) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@5 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Use Effect Gravity"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"EffectGravity" forKey:@"key"];
		[spec setProperty:@YES forKey:@"UpdateEffectCell"];
		[spec setProperty:@YES forKey:@"default"];
        [specifiers addObject:spec];
		
		
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Accelerometer Update Interval"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Accelerometer Update Interval" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Accelerometer"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"AccelerometerTime" forKey:@"key"];
		[spec setProperty:@(0.3) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@1 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
		[spec setProperty:@([[self readPreferenceValue:[specifiers objectAtIndex:[specifiers count]-2]] boolValue]) forKey: @"enabled"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Use Accelerometer"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"UseAccelerometer" forKey:@"key"];
		[spec setProperty:@YES forKey:@"default"];
		[spec setProperty:@([[self readPreferenceValue:[specifiers objectAtIndex:[specifiers count]-3]] boolValue]) forKey: @"enabled"];
        [specifiers addObject:spec];
		
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Explosion Force"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Explosion Force" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Explosion Force"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"ExplosionForce" forKey:@"key"];
		[spec setProperty:@(1) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@10 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Use in Dock"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSwitchCell
											  edit:Nil];
		[spec setProperty:@"ExplosionDock" forKey:@"key"];
		[spec setProperty:@NO forKey:@"default"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Move Icon More Swipe"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Move Icon More Swipe" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Move Icon More Swipe"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"MoveIconSwipe" forKey:@"key"];
		[spec setProperty:@(4) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@20 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];
		
		spec = [PSSpecifier preferenceSpecifierNamed:@"Move Icon Sandwiched Out"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Move Icon Sandwiched Out" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Move Icon Sandwiched Out"
                                              target:self
											  set:@selector(setPreferenceValue:specifier:)
											  get:@selector(readPreferenceValue:)
                                              detail:Nil
											  cell:PSSliderCell
											  edit:Nil];
		[spec setProperty:@"MoveIconSplitOut" forKey:@"key"];
		[spec setProperty:@(15) forKey:@"default"];
		[spec setProperty:@0 forKey:@"min"];
		[spec setProperty:@50 forKey:@"max"];
		[spec setProperty:@NO forKey:@"isContinuous"];
		[spec setProperty:@YES forKey:@"showValue"];
        [specifiers addObject:spec];

		spec = [PSSpecifier preferenceSpecifierNamed:@"Activator"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Activator" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Gravity Toogle Effect"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
		if (access("/usr/lib/libactivator.dylib", F_OK) == 0) {
			[spec setProperty:@YES forKey:@"isContoller"];
			[spec setProperty:@"com.julioverne.gravity" forKey:@"activatorListener"];
			[spec setProperty:@"/System/Library/PreferenceBundles/LibActivator.bundle" forKey:@"lazy-bundle"];
			spec->action = @selector(lazyLoadBundle:);
		}
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Gravity On/Off"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
		if (access("/usr/lib/libactivator.dylib", F_OK) == 0) {
			[spec setProperty:@YES forKey:@"isContoller"];
			[spec setProperty:@"com.julioverne.gravity.on-off" forKey:@"activatorListener"];
			[spec setProperty:@"/System/Library/PreferenceBundles/LibActivator.bundle" forKey:@"lazy-bundle"];
			spec->action = @selector(lazyLoadBundle:);
		}
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Gravity Explosion Toogle"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
		if (access("/usr/lib/libactivator.dylib", F_OK) == 0) {
			[spec setProperty:@YES forKey:@"isContoller"];
			[spec setProperty:@"com.julioverne.gravity.explosion" forKey:@"activatorListener"];
			[spec setProperty:@"/System/Library/PreferenceBundles/LibActivator.bundle" forKey:@"lazy-bundle"];
			spec->action = @selector(lazyLoadBundle:);
		}
        [specifiers addObject:spec];
		spec = [PSSpecifier emptyGroupSpecifier];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Reset Settings"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(reset);
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Developer"
		                                      target:self
											  set:Nil
											  get:Nil
                                              detail:Nil
											  cell:PSGroupCell
											  edit:Nil];
		[spec setProperty:@"Developer" forKey:@"label"];
        [specifiers addObject:spec];
		spec = [PSSpecifier preferenceSpecifierNamed:@"Follow julioverne"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(twitter);
		[spec setProperty:[NSNumber numberWithBool:TRUE] forKey:@"hasIcon"];
		[spec setProperty:[UIImage imageWithContentsOfFile:[[self bundle] pathForResource:@"twitter" ofType:@"png"]] forKey:@"iconImage"];
        [specifiers addObject:spec];
		spec = [PSSpecifier emptyGroupSpecifier];
        [spec setProperty:@"Gravity © 2016 julioverne" forKey:@"footerText"];
        [specifiers addObject:spec];
		_specifiers = [specifiers copy];
	}
	return _specifiers;
}
- (void)reset
{
	[@{} writeToFile:@PLIST_PATH_Settings atomically:YES];
	[self reloadSpecifiers];
	notify_post("com.julioverne.gravity/Settings");
}
- (void)twitter
{
	UIApplication *app = [UIApplication sharedApplication];
	if ([app canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=ijulioverne"]]) {
		[app openURL:[NSURL URLWithString:@"twitter://user?screen_name=ijulioverne"]];
	} else if ([app canOpenURL:[NSURL URLWithString:@"tweetbot:///user_profile/ijulioverne"]]) {
		[app openURL:[NSURL URLWithString:@"tweetbot:///user_profile/ijulioverne"]];		
	} else {
		[app openURL:[NSURL URLWithString:@"https://mobile.twitter.com/ijulioverne"]];
	}
}
- (void)love
{
	SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
	[twitter setInitialText:@"#Gravity by @ijulioverne is cool!"];
	if (twitter != nil) {
		[[self navigationController] presentViewController:twitter animated:YES completion:nil];
	}
}
- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier
{
	@autoreleasepool {
		NSMutableDictionary *CydiaEnablePrefsCheck = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH_Settings]?:[NSMutableDictionary dictionary];
		[CydiaEnablePrefsCheck setObject:value forKey:[specifier identifier]];
		[CydiaEnablePrefsCheck writeToFile:@PLIST_PATH_Settings atomically:YES];
		notify_post("com.julioverne.gravity/Settings");
		if ([[specifier properties] objectForKey:@"UpdateAppCell"]) {
			if (PSSpecifier* cellApp = [self specifierAtIndex:6]) {
				[cellApp setProperty:@([value boolValue]) forKey: @"enabled"];
				if (access("/usr/lib/libactivator.dylib", F_OK) == 0) {
					[cellApp setProperty:@NO forKey: @"enabled"];
				}
				[self reloadSpecifierAtIndex:6 animated:YES];
			}
		} else if ([[specifier properties] objectForKey:@"UpdateEffectCell"]) {
			if (PSSpecifier* cellApp = [self specifierAtIndex:21]) {
				[cellApp setProperty:@([value boolValue]) forKey: @"enabled"];
				[self reloadSpecifierAtIndex:21 animated:YES];
			}
			if (PSSpecifier* cellApp = [self specifierAtIndex:22]) {
				[cellApp setProperty:@([value boolValue]) forKey: @"enabled"];
				[self reloadSpecifierAtIndex:22 animated:YES];
			}
		}
	}
}
- (id)readPreferenceValue:(PSSpecifier*)specifier
{
	@autoreleasepool {
		NSDictionary *CydiaEnablePrefsCheck = [[NSDictionary alloc] initWithContentsOfFile:@PLIST_PATH_Settings];
		id valueRet = CydiaEnablePrefsCheck[[specifier identifier]]?:[[specifier properties] objectForKey:@"default"];
		if ([[specifier properties] objectForKey:@"HomeButtonTapCell"]) {
			if (PSSpecifier* cellApp = [self specifierAtIndex:5]) {
				id enabled = [self readPreferenceValue:cellApp]?:@YES;
				return [enabled boolValue]?valueRet:@YES;
			}
		}
		return valueRet;
	}
}
- (void)_returnKeyPressed:(id)arg1
{
	[super _returnKeyPressed:arg1];
	[self.view endEditing:YES];
}

- (void)HeaderCell
{
	@autoreleasepool {
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 120)];
	int width = [[UIScreen mainScreen] bounds].size.width;
	CGRect frame = CGRectMake(0, 20, width, 60);
		CGRect botFrame = CGRectMake(0, 55, width, 60);
 
		_label = [[UILabel alloc] initWithFrame:frame];
		[_label setNumberOfLines:1];
		_label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
		[_label setText:@"Gravity"];
		[_label setBackgroundColor:[UIColor clearColor]];
		_label.textColor = [UIColor blackColor];
		_label.textAlignment = NSTextAlignmentCenter;
		_label.alpha = 0;

		underLabel = [[UILabel alloc] initWithFrame:botFrame];
		[underLabel setNumberOfLines:1];
		underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
		[underLabel setText:@"Graviboard alternative"];
		[underLabel setBackgroundColor:[UIColor clearColor]];
		underLabel.textColor = [UIColor grayColor];
		underLabel.textAlignment = NSTextAlignmentCenter;
		underLabel.alpha = 0;
		
		[headerView addSubview:_label];
		[headerView addSubview:underLabel];
		
	[_table setTableHeaderView:headerView];
	
	[NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(increaseAlpha)
                                   userInfo:nil
                                    repeats:NO];
				
	}
}
- (void) loadView
{
	[super loadView];
	[self HeaderCell];
	self.title = @"Gravity";
	[UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = [UIColor colorWithRed:0.09 green:0.99 blue:0.99 alpha:1.0];
	UIButton *heart = [[UIButton alloc] initWithFrame:CGRectZero];
	[heart setImage:[[UIImage alloc] initWithContentsOfFile:[[self bundle] pathForResource:@"Heart" ofType:@"png"]] forState:UIControlStateNormal];
	[heart sizeToFit];
	[heart addTarget:self action:@selector(love) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:heart];
}
- (void)increaseAlpha
{
	[UIView animateWithDuration:0.5 animations:^{
		_label.alpha = 1;
	}completion:^(BOOL finished) {
		[UIView animateWithDuration:0.5 animations:^{
			underLabel.alpha = 1;
		}completion:nil];
	}];
}				
@end
