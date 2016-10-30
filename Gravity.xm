#import "Gravity.h"
#import <CoreMotion/CoreMotion.h>
#import <libactivator/libactivator.h>
static BOOL gravityEnabled;
static BOOL gravityHomeButtonTap;
static BOOL gravityUseAccelerometer;
static BOOL gravityAllowTapIcon;
static BOOL gravityHideLabelIcon;
static BOOL gravityAutomatically;
static BOOL gravityEffectGravity;
static BOOL gravityNotFirstUnlock;
static BOOL gravityFirstLaunch;
static BOOL gravityUseInDock;
static BOOL gravityExplosionDock;
static BOOL gravityAllowsRotation;
static float gravityBounce;
static float gravityFriction;
static float gravitySpeed;
static float gravityAngularResistance;
static float gravityExplosionForce;
static float gravityGravityForce;
static float gravityAccelerometerTime;
static float gravityMoveIconSwipe;
static float gravityMoveIconSplitOut;
static BOOL isEnabledEffect;
static BOOL isDeviceUnlocked;
static float iconHeight = 0;
static float iconWidth = 0;
static __strong myMotion* myMotionIstanceNew;
static __strong myMotion* myMotionIstanceNewDock;
static __strong UIAttachmentBehavior *attachment;

@implementation GravityPanGestureRecognizer
@synthesize isDock;
@end

@implementation GravityPushBehavior
@end

@implementation GravityDynamicItemBehavior
@end

@interface UICollisionBehavior ()
- (void)_didBeginContact:(id)arg1;
- (void)_didEndContact:(id)arg1;
@end

@implementation GravityCollisionBehavior
- (void)_didBeginContact:(PKPhysicsContact*)item
{
	@autoreleasepool {
		CGFloat MaxWidth = myMotionIstanceNew.animator.myFrame.size.width-10;
		CGFloat MaxHeight = myMotionIstanceNew.animator.myFrame.size.height-10;
		CGPoint newP = CGPointMake(MaxWidth/2, MaxHeight/2);
		CGPoint sizeLoc = item.bodyA.position;
		if(sizeLoc.x < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.x > MaxWidth) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y > MaxHeight) {
			item.bodyA.position = newP;
		}
		
		CGPoint sizeLocB = item.bodyB.position;
		if(sizeLocB.x < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.x > MaxWidth) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y > MaxHeight) {
			item.bodyB.position = newP;
		}
	}
	[super _didBeginContact:item];
}
- (void)_didEndContact:(PKPhysicsContact*)item
{
	@autoreleasepool {
		CGFloat MaxWidth = myMotionIstanceNew.animator.myFrame.size.width-10;
		CGFloat MaxHeight = myMotionIstanceNew.animator.myFrame.size.height-10;
		CGPoint newP = CGPointMake(MaxWidth/2, MaxHeight/2);
		CGPoint sizeLoc = item.bodyA.position;
		if(sizeLoc.x < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.x > MaxWidth) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y > MaxHeight) {
			item.bodyA.position = newP;
		}
		
		CGPoint sizeLocB = item.bodyB.position;
		if(sizeLocB.x < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.x > MaxWidth) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y > MaxHeight) {
			item.bodyB.position = newP;
		}
	}
	[super _didEndContact:item];
}
@end
@implementation GravityDKCollisionBehavior
- (void)_didBeginContact:(PKPhysicsContact*)item
{
	@autoreleasepool {
		CGFloat MaxWidth = myMotionIstanceNew.animator.myFrame.size.width-10;
		CGFloat MaxHeight = myMotionIstanceNew.animator.myFrame.size.height-10;
		CGPoint newP = CGPointMake(MaxWidth/2, MaxHeight/4);
		CGPoint sizeLoc = item.bodyA.position;
		if(sizeLoc.x < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.x > MaxWidth) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y > MaxHeight) {
			item.bodyA.position = newP;
		}
		
		CGPoint sizeLocB = item.bodyB.position;
		if(sizeLocB.x < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.x > MaxWidth) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y > MaxHeight) {
			item.bodyB.position = newP;
		}
	}
	[super _didBeginContact:item];
}
- (void)_didEndContact:(PKPhysicsContact*)item
{
	@autoreleasepool {
		CGFloat MaxWidth = myMotionIstanceNewDock.animator.myFrame.size.width;
		CGFloat MaxHeight = myMotionIstanceNewDock.animator.myFrame.size.height;
		CGPoint newP = CGPointMake(MaxWidth/2, MaxHeight/4);
		CGPoint sizeLoc = item.bodyA.position;
		if(sizeLoc.x < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.x > MaxWidth) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y < 0) {
			item.bodyA.position = newP;
		}
		if(sizeLoc.y > MaxHeight) {
			item.bodyA.position = newP;
		}
		
		CGPoint sizeLocB = item.bodyB.position;
		if(sizeLocB.x < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.x > MaxWidth) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y < 0) {
			item.bodyB.position = newP;
		}
		if(sizeLocB.y > MaxHeight) {
			item.bodyB.position = newP;
		}
	}
	[super _didEndContact:item];
}
@end
@implementation GravityDynamicAnimator
@synthesize myFrame;
- (CGRect)_referenceSystemBounds
{
	return myFrame;
}
@end
UIView* currentPressIcon;
GravityPushBehavior* pushBehaviorIcon;
@implementation myMotion
@synthesize collision, collisionDK, animator, gravity, itemBehaviour, motionManager, orientation;
- (id)init {
	self = [super init];
	return self;
}
- (CGRect)frame {
	if(animator) {
		return [animator myFrame];
	}
	return CGRectZero;
}
- (CMMotionManager*)motionHere {
	if(!motionManager) {
		if(myMotionIstanceNew != nil) {
			if(myMotionIstanceNew.motionManager != nil) {
				if(myMotionIstanceNew.motionManager.accelerometerActive) {
					[myMotionIstanceNew.motionManager stopAccelerometerUpdates];
				}
			}
		}
		motionManager = [[CMMotionManager alloc] init];
		motionManager.accelerometerUpdateInterval = gravityAccelerometerTime;
		[motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *data, NSError *error) {
			dispatch_async(dispatch_get_main_queue(), ^{
				@autoreleasepool {
					if(!myMotionIstanceNew) {
						return;
					}
					if(!gravityUseAccelerometer) {
						[myMotionIstanceNew.motionManager stopAccelerometerUpdates];
					}
					CGFloat xDirect = data.acceleration.x; 
					CGFloat yDirect = data.acceleration.y;
					CGFloat AngleDirection;
					if(myMotionIstanceNew.orientation == 1) {
						AngleDirection = atan2(-yDirect, xDirect); //Normal
					} else if(myMotionIstanceNew.orientation == 2) {
						AngleDirection = atan2(yDirect, -xDirect); //Upsidown
					} else if(myMotionIstanceNew.orientation == 3) {
						AngleDirection = atan2(-xDirect, -yDirect); //HomeButton Right
					} else if(myMotionIstanceNew.orientation == 4) {
						AngleDirection = atan2(xDirect, yDirect);  //HomeButton Left
					} else {
						AngleDirection = atan2(-yDirect, xDirect); //Normal
					}
					if(myMotionIstanceNew.gravity) {
						myMotionIstanceNew.gravity.angle = AngleDirection;
						myMotionIstanceNew.gravity.magnitude = gravityGravityForce;
					}
					if(myMotionIstanceNewDock) {
						if(myMotionIstanceNewDock.gravity) {
							myMotionIstanceNewDock.gravity.angle = AngleDirection;
							myMotionIstanceNewDock.gravity.magnitude = gravityGravityForce;
						}
					}
				}
			});
		}];
	}
	return motionManager;
}
- (GravityDynamicAnimator*)animatorHere:(UIView*)view {
	if(!animator) {
		animator = [[GravityDynamicAnimator alloc] initWithReferenceView:view];
	}
	return animator;
}
- (UIGravityBehavior*)gravityHere:(NSArray*)item {
	if(!gravity) {
		gravity = [[UIGravityBehavior alloc] initWithItems:item];
	}
	return gravity;
}
- (GravityCollisionBehavior*)collisionHere:(NSArray*)item {
	if(!collision) {
		collision = [[GravityCollisionBehavior alloc] initWithItems:item];
	}
	return collision;
}
- (GravityDKCollisionBehavior*)collisionDKHere:(NSArray*)item {
	if(!collisionDK) {
		collisionDK = [[GravityDKCollisionBehavior alloc] initWithItems:item];
	}
	return collisionDK;
}
- (GravityDynamicItemBehavior*)itemBehaviourHere:(NSArray*)item {
	if(!itemBehaviour) {
		itemBehaviour = [[GravityDynamicItemBehavior alloc] initWithItems:item];
	}
	return itemBehaviour;
}
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(UIView*)item1 withItem:(UIView*)item2 atPoint:(CGPoint)atPoint
{
	if(currentPressIcon && (currentPressIcon==item2||currentPressIcon==item1) ) {
		if(pushBehaviorIcon != nil) {
			[animator removeBehavior:pushBehaviorIcon];
		}		
		pushBehaviorIcon = [[GravityPushBehavior alloc] initWithItems:@[currentPressIcon==item1?item2:item1] mode:(UIPushBehaviorMode)1];
		[animator addBehavior:pushBehaviorIcon];
		CGFloat angleUp = -1.5;
		if(myMotionIstanceNew.orientation == 1 || myMotionIstanceNew.orientation == 2) { //Normal
			if(atPoint.x > animator.myFrame.size.width/2) {
				angleUp = -2.0; 
			} else {
				angleUp = -1.0; 
			}
		} else if(myMotionIstanceNew.orientation == 3 || myMotionIstanceNew.orientation == 4) {
			if(atPoint.x > animator.myFrame.size.height/2) {
				angleUp = -2.0; 
			} else {
				angleUp = -1.0; 
			}
		}
		pushBehaviorIcon.angle = angleUp;
		pushBehaviorIcon.magnitude = 0.2;
		pushBehaviorIcon.active = YES;
	}
}
@end
%hook SBIconController
%new
- (void)handlePanGravity:(GravityPanGestureRecognizer*)panGesture
{
	@try {
	@autoreleasepool {
		myMotion* currentMyMotion;
		if(panGesture.isDock) {
			currentMyMotion = myMotionIstanceNewDock;
		} else {
			currentMyMotion = myMotionIstanceNew;
		}
		UIGestureRecognizerState state = [panGesture state];		
		if (state == UIGestureRecognizerStateBegan) {
			currentPressIcon = [panGesture view];
			
			CGPoint centerIcon = {CGRectGetMidX(currentPressIcon.bounds), CGRectGetMidY(currentPressIcon.bounds)};
			CGPoint touch = [panGesture locationInView:currentPressIcon];
			UIOffset offset = UIOffsetMake(touch.x - centerIcon.x, touch.y - centerIcon.y);
			
			
			attachment = [[UIAttachmentBehavior alloc] initWithItem:[panGesture view] offsetFromCenter:offset attachedToAnchor:[panGesture view].center];//[[UIAttachmentBehavior alloc] initWithItem:[panGesture view] attachedToAnchor:[panGesture view].center];
			
			
			attachment.length = [panGesture view].frame.size.height/4;
			attachment.damping = gravityMoveIconSwipe; // more swipe 0
			attachment.frequency = gravityMoveIconSplitOut; // force when split out 10
			[currentMyMotion.animator addBehavior:attachment];
		} else if (state == UIGestureRecognizerStateChanged) {
			CGPoint location = [panGesture locationInView:[[panGesture view] superview]];
			if(location.x < [panGesture view].frame.size.height/2) {
				location.x = [panGesture view].frame.size.height/2;
			}
			if(location.y < [panGesture view].frame.size.width/2) {
				location.y = [panGesture view].frame.size.width/2;
			}
			if(location.x >  currentMyMotion.animator.myFrame.size.width-5) {
				location.x = currentMyMotion.animator.myFrame.size.width-5;
			}
			if(location.y > currentMyMotion.animator.myFrame.size.height-30) {
				location.y = currentMyMotion.animator.myFrame.size.height-30;
			}
			[attachment setAnchorPoint:CGPointMake(location.x, location.y)];			
		} else if (state == UIGestureRecognizerStateEnded) {
			currentPressIcon = nil;
			[currentMyMotion.animator removeBehavior:attachment];
		}
	}
	} @catch (NSException * e) {
		
	}
}
%new
-(void)startGravityCall
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startGravity) object:self];
	[self performSelector:@selector(startGravity) withObject:self afterDelay:0.5];
}
%new
-(void)startGravity
{
	@try {
	@autoreleasepool {
	
    SBIconController* SHAREDSBIcon = [%c(SBIconController) sharedInstance];
	SBRootIconListView* currentRootIconL = [SHAREDSBIcon hasOpenFolder]?[SHAREDSBIcon currentFolderIconList]:[SHAREDSBIcon currentRootIconList];
	
	SBIconView* iconVW = [[SHAREDSBIcon respondsToSelector:@selector(homescreenIconViewMap)]?[SHAREDSBIcon homescreenIconViewMap]:[%c(SBIconViewMap) homescreenMap] iconViewForIcon:[currentRootIconL icons][0]];
	if ([iconVW respondsToSelector:@selector(_iconImageView)]) {
		CGRect iconV = [iconVW _iconImageView].frame;
		iconHeight = iconV.size.height;
		iconWidth = iconV.size.width;
	}
	
	if(myMotionIstanceNew) {
		[self restoreFrameGravity];
		myMotionIstanceNew = [[myMotion alloc] init];
	} else {
		myMotionIstanceNew = [[myMotion alloc] init];
	}
	
	isEnabledEffect = YES;
	
	UIView* iconArea = [iconVW superview];
	//UIView* toNSlog = [[[[iconArea superview] superview] superview] superview];
	//NSLog(@"****toNSlog: %@", toNSlog);
	myMotionIstanceNew.animator = [myMotionIstanceNew animatorHere:iconArea];
	[myMotionIstanceNew.animator setMyFrame:CGRectMake(0, currentRootIconL.frame.origin.y, currentRootIconL.frame.size.width, currentRootIconL.frame.size.height)];
	
	myMotionIstanceNew.orientation = [SHAREDSBIcon orientation];
	
	NSMutableArray* icons = [NSMutableArray array];
	NSArray* visibleIcons = [currentRootIconL icons];
	for (id iconNow in visibleIcons) {
		if(![iconNow isKindOfClass:%c(ANPlaceHolderIcon)]) {
		SBIconView* iconV = [[SHAREDSBIcon respondsToSelector:@selector(homescreenIconViewMap)]?[SHAREDSBIcon homescreenIconViewMap]:[%c(SBIconViewMap) homescreenMap] iconViewForIcon:iconNow];
		if(_UILegibilityView* label = (_UILegibilityView*)object_getIvar(iconV, class_getInstanceVariable(%c(SBIconView), "_labelView"))) {
			label.hidden = gravityHideLabelIcon?YES:NO;
		}
		float iconVX = iconV.frame.origin.x;
		float iconVY = iconV.frame.origin.y;
		if(iconVX >= myMotionIstanceNew.animator.myFrame.size.width) {
			iconVX = 10;
		}
		if(iconVX <= 0) {
			iconVX = 10;
		}
		if(iconVY >= myMotionIstanceNew.animator.myFrame.size.height) {
			iconVY = 10;
		}
		if(iconVY <= 0) {
			iconVY = 10;
		}
		if(iconHeight > 1) {
			iconV.frame = CGRectMake(iconVX, iconVY, iconWidth, iconHeight);
		} else {
			iconV.frame = CGRectMake(iconVX, iconVY, iconV.frame.size.width, iconV.frame.size.height);
		}		
		
		for(GravityPanGestureRecognizer *recognizer in iconV.gestureRecognizers) {
			if([recognizer isKindOfClass:[GravityPanGestureRecognizer class]]) {
				[iconV removeGestureRecognizer:recognizer];
			}
		}
		GravityPanGestureRecognizer* iconPanGesture = [[GravityPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGravity:)];
		iconPanGesture.isDock = [iconV isInDock];
		[iconPanGesture setMaximumNumberOfTouches:1];
		[iconPanGesture setMinimumNumberOfTouches:1];
		[iconPanGesture setCancelsTouchesInView:YES];
		[iconPanGesture setEnabled:YES];
		[iconV addGestureRecognizer:iconPanGesture];
		[icons addObject:iconV];
		}
	}
	
	GravityCollisionBehavior* collision = [myMotionIstanceNew collisionHere:icons];
	collision.translatesReferenceBoundsIntoBoundary = YES;
	[collision setCollisionMode:UICollisionBehaviorModeEverything];
	collision.collisionDelegate = (id)myMotionIstanceNew;
	
	GravityDynamicItemBehavior* itemBehaviour = [myMotionIstanceNew itemBehaviourHere:icons];
	itemBehaviour.elasticity = gravityBounce;
	itemBehaviour.friction = gravityFriction;
	itemBehaviour.density = 100;
	itemBehaviour.resistance = gravitySpeed;
	itemBehaviour.allowsRotation = gravityAllowsRotation;
	itemBehaviour.angularResistance = gravityAngularResistance;
	
	[myMotionIstanceNew.animator addBehavior:collision];
	
	[myMotionIstanceNew.animator addBehavior:itemBehaviour];
	
	if(gravityEffectGravity) {
		UIGravityBehavior* gravity = [myMotionIstanceNew gravityHere:icons];
		gravity.magnitude = gravityGravityForce;
		[myMotionIstanceNew.animator addBehavior:gravity];
		if(gravityUseAccelerometer) {
			CMMotionManager *motionManager = [myMotionIstanceNew motionHere];
			motionManager.accelerometerUpdateInterval = gravityAccelerometerTime;
			if(!motionManager.accelerometerActive) {
				[motionManager startAccelerometerUpdates];
			}
		}
	}
	
	if(gravityUseInDock) {
		[self startGravityDock];
	}
	
	isEnabledEffect = YES;
	
	}	
	} @catch (NSException * e) {
		
	}
}
%new
- (void)restoreFrameGravity
{
	@try {
	@autoreleasepool {
	SBIconController* SHAREDSBIcon = [%c(SBIconController) sharedInstance];
	SBRootIconListView* currentRootIconL = [SHAREDSBIcon hasOpenFolder]?[SHAREDSBIcon currentFolderIconList]:[SHAREDSBIcon currentRootIconList];
	
	if(myMotionIstanceNew != nil) {
		if(myMotionIstanceNew.motionManager != nil) {
			if(myMotionIstanceNew.motionManager.accelerometerActive) {
				[myMotionIstanceNew.motionManager stopAccelerometerUpdates];
			}
		}
		for(SBIconView* iconV in [myMotionIstanceNew.gravity items]) {
			[myMotionIstanceNew.gravity removeItem:iconV];
		}
		for(SBIconView* itemNowCollision in [myMotionIstanceNew.collision items]) {
			[myMotionIstanceNew.collision removeItem:itemNowCollision];
		}
		for(SBIconView* iconV in [myMotionIstanceNew.itemBehaviour items]) {
			if(_UILegibilityView* label = (_UILegibilityView*)object_getIvar(iconV, class_getInstanceVariable(%c(SBIconView), "_labelView"))) {
				label.hidden = gravityHideLabelIcon?YES:NO;
			}
			[UIView beginAnimations:@"rotate" context:nil];
			[UIView setAnimationDuration:0.2];
			iconV.transform = CGAffineTransformIdentity;
			[UIView commitAnimations];
			for(GravityPanGestureRecognizer *recognizer in iconV.gestureRecognizers) {
				if([recognizer isKindOfClass:[GravityPanGestureRecognizer class]]) {
					[iconV removeGestureRecognizer:recognizer];
				}
			}
			[myMotionIstanceNew.itemBehaviour removeItem:iconV];
		}
		[myMotionIstanceNew.animator removeAllBehaviors];	
	}
	
	[currentRootIconL setIconsNeedLayout];
	[currentRootIconL layoutIconsIfNeeded:0.2 domino:NO];
	
	
	currentRootIconL = [SHAREDSBIcon dockListView];
	if(myMotionIstanceNewDock != nil) {
		for(SBIconView* iconV in [myMotionIstanceNewDock.gravity items]) {
			[myMotionIstanceNewDock.gravity removeItem:iconV];
		}
		for(SBIconView* itemNowCollision in [myMotionIstanceNewDock.collision items]) {
			[myMotionIstanceNewDock.collision removeItem:itemNowCollision];
		}
		for(SBIconView* iconV in [myMotionIstanceNewDock.itemBehaviour items]) {
			if(_UILegibilityView* label = (_UILegibilityView*)object_getIvar(iconV, class_getInstanceVariable(%c(SBIconView), "_labelView"))) {
				label.hidden = gravityHideLabelIcon?YES:NO;
			}
			[UIView beginAnimations:@"rotate" context:nil];
			[UIView setAnimationDuration:0.2];
			iconV.transform = CGAffineTransformIdentity;
			[UIView commitAnimations];
			for(GravityPanGestureRecognizer *recognizer in iconV.gestureRecognizers) {
				if([recognizer isKindOfClass:[GravityPanGestureRecognizer class]]) {
					[iconV removeGestureRecognizer:recognizer];
				}
			}
			[myMotionIstanceNewDock.itemBehaviour removeItem:iconV];
		}
		[myMotionIstanceNewDock.animator removeAllBehaviors];
	}	
	[currentRootIconL setIconsNeedLayout];
	[currentRootIconL layoutIconsIfNeeded:0.2 domino:NO];
	
	
	isEnabledEffect = NO;
	
	}
	} @catch (NSException * e) {
	}
}
%new
- (void)explosionGravity
{
	@try {
	@autoreleasepool {
	if(!gravityEnabled || !isEnabledEffect || myMotionIstanceNew == nil) {
		return;
	}
	SBIconController* SHAREDSBIcon = [%c(SBIconController) sharedInstance];
	SBRootIconListView* currentRootIconL = [SHAREDSBIcon hasOpenFolder]?[SHAREDSBIcon currentFolderIconList]:[SHAREDSBIcon currentRootIconList];
	
	for (id beravior in [myMotionIstanceNew.animator behaviors]) {
		if([beravior isKindOfClass:[GravityPushBehavior class]]) {
			[myMotionIstanceNew.animator removeBehavior:beravior];
		}
	}
	for (id iconNow in [currentRootIconL icons]) {
		if(![iconNow isKindOfClass:%c(ANPlaceHolderIcon)]) {
		UIView* iconV = [[SHAREDSBIcon respondsToSelector:@selector(homescreenIconViewMap)]?[SHAREDSBIcon homescreenIconViewMap]:[%c(SBIconViewMap) homescreenMap] iconViewForIcon:iconNow];
		if(_UILegibilityView* label = (_UILegibilityView*)object_getIvar(iconV, class_getInstanceVariable(%c(SBIconView), "_labelView"))) {
			label.hidden = gravityHideLabelIcon?YES:NO;
		}
		GravityPushBehavior* pushBehavior = [[GravityPushBehavior alloc] initWithItems:@[iconV] mode:(UIPushBehaviorMode)1];
		[myMotionIstanceNew.animator addBehavior:pushBehavior];
		}
	}
	for (GravityPushBehavior* pushBeravior in [myMotionIstanceNew.animator behaviors]) {
		if([pushBeravior isKindOfClass:[GravityPushBehavior class]]) {
			pushBeravior.angle = rand() * 2.0;
			pushBeravior.magnitude = gravityExplosionForce;
			pushBeravior.active = YES;
		}
	}
	if(!gravityExplosionDock || myMotionIstanceNewDock == nil) {
		return;
	}
	currentRootIconL = [SHAREDSBIcon dockListView];
	for (id beravior in [myMotionIstanceNewDock.animator behaviors]) {
		if([beravior isKindOfClass:[GravityPushBehavior class]]) {
			[myMotionIstanceNewDock.animator removeBehavior:beravior];
		}
	}
	for (id iconNow in [currentRootIconL icons]) {
		if(![iconNow isKindOfClass:%c(ANPlaceHolderIcon)]) {
		UIView* iconV = [[SHAREDSBIcon respondsToSelector:@selector(homescreenIconViewMap)]?[SHAREDSBIcon homescreenIconViewMap]:[%c(SBIconViewMap) homescreenMap] iconViewForIcon:iconNow];
		if(_UILegibilityView* label = (_UILegibilityView*)object_getIvar(iconV, class_getInstanceVariable(%c(SBIconView), "_labelView"))) {
			label.hidden = gravityHideLabelIcon?YES:NO;
		}
		GravityPushBehavior* pushBehavior = [[GravityPushBehavior alloc] initWithItems:@[iconV] mode:(UIPushBehaviorMode)1];
		[myMotionIstanceNewDock.animator addBehavior:pushBehavior];
		}
	}
	for (GravityPushBehavior* pushBeravior in [myMotionIstanceNewDock.animator behaviors]) {
		if([pushBeravior isKindOfClass:[GravityPushBehavior class]]) {
			pushBeravior.angle = rand() * 2.0;
			pushBeravior.magnitude = gravityExplosionForce;
			pushBeravior.active = YES;
		}
	}
	}
	} @catch (NSException * e) {
		
	}
}
%new
-(void)startGravityDock
{
	@try {
	@autoreleasepool {
    SBIconController* SHAREDSBIcon = [%c(SBIconController) sharedInstance];
	
	SBRootIconListView* currentRootIconL = [SHAREDSBIcon dockListView];
	
	CGFloat iconHeightDock;
	CGFloat iconWidthDock;
	SBIconView* iconVW = [[SHAREDSBIcon respondsToSelector:@selector(homescreenIconViewMap)]?[SHAREDSBIcon homescreenIconViewMap]:[%c(SBIconViewMap) homescreenMap] iconViewForIcon:[currentRootIconL icons][0]];
	if ([iconVW respondsToSelector:@selector(_iconImageView)]) {
		CGRect iconV = [iconVW _iconImageView].frame;
		iconHeightDock = iconV.size.height;
		iconWidthDock = iconV.size.width;
	}		
	
	
	if(myMotionIstanceNewDock) {
		for(UIView* itemNowGravity in [myMotionIstanceNewDock.gravity items]) {
			[myMotionIstanceNewDock.gravity removeItem:itemNowGravity];
			if(iconHeightDock > 1){
				itemNowGravity.frame = CGRectMake(itemNowGravity.frame.origin.x, itemNowGravity.frame.origin.y, iconWidthDock, iconHeightDock);
			}
			for(GravityPanGestureRecognizer *recognizer in itemNowGravity.gestureRecognizers) {
				if([recognizer isKindOfClass:[GravityPanGestureRecognizer class]]) {
					[itemNowGravity removeGestureRecognizer:recognizer];
				}
			}		
		}
		for(UIView* itemNowCollision in [myMotionIstanceNewDock.collision items]) {
			[myMotionIstanceNewDock.collision removeItem:itemNowCollision];
		}
		for(UIView* itemNowItemBehaviour in [myMotionIstanceNewDock.itemBehaviour items]) {
			[myMotionIstanceNewDock.itemBehaviour removeItem:itemNowItemBehaviour];
		}
		[myMotionIstanceNewDock.animator removeAllBehaviors];
		myMotionIstanceNewDock = [[myMotion alloc] init];
	} else {
		myMotionIstanceNewDock = [[myMotion alloc] init];		
	}
	
	myMotionIstanceNewDock.animator = [myMotionIstanceNewDock animatorHere:[iconVW superview]];
	[myMotionIstanceNewDock.animator setMyFrame:CGRectMake(0, currentRootIconL.frame.origin.y, currentRootIconL.frame.size.width, currentRootIconL.frame.size.height-10)];
	
	myMotionIstanceNewDock.orientation = [SHAREDSBIcon orientation];
	
	NSMutableArray* icons = [NSMutableArray array];
	NSArray* visibleIcons = [currentRootIconL icons];
	
	for (id iconNow in visibleIcons) {
		if(![iconNow isKindOfClass:%c(ANPlaceHolderIcon)]) {
		SBIconView* iconV = [[SHAREDSBIcon respondsToSelector:@selector(homescreenIconViewMap)]?[SHAREDSBIcon homescreenIconViewMap]:[%c(SBIconViewMap) homescreenMap] iconViewForIcon:iconNow];
		if(_UILegibilityView* label = (_UILegibilityView*)object_getIvar(iconV, class_getInstanceVariable(%c(SBIconView), "_labelView"))) {
			label.hidden = gravityHideLabelIcon?YES:NO;
		}
		float iconVX = iconV.frame.origin.x;
		float iconVY = iconV.frame.origin.y;
		if(iconVX >= myMotionIstanceNewDock.animator.myFrame.size.width) {
			iconVX = 10;
		}
		if(iconVX <= 0) {
			iconVX = 10;
		}
		if(iconVY >= myMotionIstanceNewDock.animator.myFrame.size.height) {
			iconVY = 10;
		}
		if(iconVY <= 0) {
			iconVY = 10;
		}
		if(iconHeightDock > 1){
			iconV.frame = CGRectMake(iconVX, iconVY, iconWidthDock, iconHeightDock);
		} else {
			iconV.frame = CGRectMake(iconVX, iconVY, iconV.frame.size.width, iconV.frame.size.height);
		}
		for(GravityPanGestureRecognizer *recognizer in iconV.gestureRecognizers) {
			if([recognizer isKindOfClass:[GravityPanGestureRecognizer class]]) {
				[iconV removeGestureRecognizer:recognizer];
			}
			
		}
		GravityPanGestureRecognizer* iconPanGesture = [[GravityPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGravity:)];
		iconPanGesture.isDock = [iconV isInDock];
		[iconPanGesture setMaximumNumberOfTouches:1];
		[iconPanGesture setMinimumNumberOfTouches:1];
		[iconPanGesture setCancelsTouchesInView:YES];
		[iconPanGesture setEnabled:YES];
		[iconV addGestureRecognizer:iconPanGesture];
		[icons addObject:iconV];
		}
	}
	
	GravityDKCollisionBehavior* collision = [myMotionIstanceNewDock collisionDKHere:icons];
	collision.translatesReferenceBoundsIntoBoundary = YES;
	[collision setCollisionMode:UICollisionBehaviorModeEverything];
	collision.collisionDelegate = (id)myMotionIstanceNewDock;
	
	
	GravityDynamicItemBehavior* itemBehaviour = [myMotionIstanceNewDock itemBehaviourHere:icons];	
	itemBehaviour.elasticity = gravityBounce;
	itemBehaviour.friction = gravityFriction;
	itemBehaviour.density = 100;
	itemBehaviour.resistance = gravitySpeed;
	itemBehaviour.allowsRotation = gravityAllowsRotation;
	itemBehaviour.angularResistance = gravityAngularResistance;
	
	
	[myMotionIstanceNewDock.animator addBehavior:collision];
	[myMotionIstanceNewDock.animator addBehavior:itemBehaviour];
	
	if(gravityEffectGravity) {
		UIGravityBehavior* gravity = [myMotionIstanceNewDock gravityHere:icons];
		gravity.magnitude = gravityGravityForce;
		[myMotionIstanceNewDock.animator addBehavior:gravity];
	}
	}
	} @catch (NSException * e) {
		
	}
}
%end
%hook SBIconListPageControl
-(void)setCurrentPage:(long long)arg1
{
	if(gravityEnabled && isDeviceUnlocked && gravityAutomatically) {
		if(!isEnabledEffect) {
			[[%c(SBIconController) sharedInstance] startGravityCall];
		}
	}
	%orig(arg1);
}
%end
%hook SBIconScrollView
- (void)_scrollViewWillBeginDragging
{
	if(isEnabledEffect) {
		isEnabledEffect = NO;
		[[%c(SBIconController) sharedInstance] restoreFrameGravity];
	}
	%orig;
}
%end
%hook SBIconController
- (BOOL)iconShouldAllowTap:(id)icon
{
	if(gravityEnabled&& (!gravityAllowTapIcon&&isEnabledEffect) ) {
		return NO;
	} else if(gravityEnabled&&isEnabledEffect) {
		[[%c(SBIconController) sharedInstance] restoreFrameGravity];
		return %orig();
	} else {
		return %orig();
	}
}
- (void)willRotateToInterfaceOrientation:(int)arg1 duration:(double)duration
{
	if(gravityEnabled && isDeviceUnlocked && isEnabledEffect) {
		[self restoreFrameGravity];
	}
	%orig(arg1, duration);
	
	if(gravityEnabled && isDeviceUnlocked && gravityAutomatically) {
		[self startGravityCall];
	}
}
-(void)_folderDidFinishOpenClose:(BOOL)_folder animated:(BOOL)animated
{
	if(gravityEnabled&&gravityAutomatically&&!_folder) {
		[[%c(SBIconController) sharedInstance] startGravityCall];
	}
	%orig(_folder, animated);
}
-(void)iconHandleLongPress:(SBIconView*)press
{
	if(gravityEnabled&&isEnabledEffect) {
		[[%c(SBIconController) sharedInstance] restoreFrameGravity];
	}
	%orig(press);
}
-(void)handleHomeButtonTap
{
	if(gravityEnabled&& (gravityHomeButtonTap || !gravityAllowTapIcon) ) {
		if(isEnabledEffect) {
			[[%c(SBIconController) sharedInstance] restoreFrameGravity];
		} else {
			[[%c(SBIconController) sharedInstance] startGravityCall];
			
		}
	} else {
		%orig();
	}
}
%end
@implementation GravityActivator
+ (id)sharedInstance
{
    __strong static id _sharedObject;
	if (!_sharedObject) {
		_sharedObject = [[self alloc] init];
	}
	return _sharedObject;
}
- (void)RegisterActions
{
    if (access("/usr/lib/libactivator.dylib", F_OK) == 0) {
		dlopen("/usr/lib/libactivator.dylib", RTLD_LAZY);
	    if (Class la = objc_getClass("LAActivator")) {
			[[la sharedInstance] registerListener:(id<LAListener>)self forName:@"com.julioverne.gravity"];
			[[la sharedInstance] registerListener:(id<LAListener>)self forName:@"com.julioverne.gravity.explosion"];
			[[la sharedInstance] registerListener:(id<LAListener>)self forName:@"com.julioverne.gravity.on-off"];
			if (![[la sharedInstance] eventWithNameRequiresAssignment:@"libactivator.motion.shake"]) {
				[[la sharedInstance] assignEvent:[%c(LAEvent) eventWithName:@"libactivator.motion.shake" mode:@"springboard"] toListenerWithName:@"com.julioverne.gravity.explosion"];
			}
			if (![[la sharedInstance] eventWithNameRequiresAssignment:@"libactivator.menu.press.single"]) {
				[[la sharedInstance] assignEvent:[%c(LAEvent) eventWithName:@"libactivator.menu.press.single" mode:@"springboard"] toListenerWithName:@"com.julioverne.gravity"];
			}
		}
	}
}
- (NSString *)activator:(LAActivator *)activator requiresLocalizedTitleForListenerName:(NSString *)listenerName
{
	return @"Gravity";
}
- (NSString *)activator:(LAActivator *)activator requiresLocalizedDescriptionForListenerName:(NSString *)listenerName
{
	if([listenerName isEqualToString:@"com.julioverne.gravity.explosion"]) {
		return @"Gravity Explosion Toogle";
	}
	return @"Gravity Toogle enable/disable";
}
- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName
{
	return @[@"springboard"];
}
- (UIImage *)activator:(LAActivator *)activator requiresIconForListenerName:(NSString *)listenerName scale:(CGFloat)scale
{
    static __strong UIImage* listenerIcon;
    if (!listenerIcon) {
		listenerIcon = [[UIImage alloc] initWithContentsOfFile:[[NSBundle bundleWithPath:@"/Library/PreferenceBundles/Gravity.bundle"] pathForResource:scale==2.0f?@"icon@2x":@"icon" ofType:@"png"]];
	}
    return listenerIcon;
}
- (UIImage *)activator:(LAActivator *)activator requiresSmallIconForListenerName:(NSString *)listenerName scale:(CGFloat)scale
{
    static __strong UIImage* listenerIcon;
    if (!listenerIcon) {
		listenerIcon = [[UIImage alloc] initWithContentsOfFile:[[NSBundle bundleWithPath:@"/Library/PreferenceBundles/Gravity.bundle"] pathForResource:scale==2.0f?@"icon@2x":@"icon" ofType:@"png"]];
	}
    return listenerIcon;
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event forListenerName:(NSString *)listenerName
{
	if([listenerName isEqualToString:@"com.julioverne.gravity.explosion"]) {
		if(gravityEnabled) {
			[[%c(SBIconController) sharedInstance] explosionGravity];			
		}
	} else if([listenerName isEqualToString:@"com.julioverne.gravity"]) {
		@autoreleasepool {
			if(isEnabledEffect) {
				[[%c(SBIconController) sharedInstance] restoreFrameGravity];
			} else {
				[[%c(SBIconController) sharedInstance] startGravityCall];	
				
			}
		}
	} else if([listenerName isEqualToString:@"com.julioverne.gravity.on-off"]) {
		@autoreleasepool {
			NSMutableDictionary *CydiaEnablePrefsCheck = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH_Settings]?:[NSMutableDictionary dictionary];
			[CydiaEnablePrefsCheck setObject:@(!gravityEnabled) forKey:@"Enabled"];
			[CydiaEnablePrefsCheck writeToFile:@PLIST_PATH_Settings atomically:YES];
			notify_post("com.julioverne.gravity/Settings");
		}
	}
	event.handled = YES;
}
@end
static void settingsChangedGravity(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	@autoreleasepool {
		NSDictionary *WidPlayerPrefs = [[[NSDictionary alloc] initWithContentsOfFile:@PLIST_PATH_Settings]?:[NSDictionary dictionary] copy];
		BOOL newGravityEnabled = (BOOL)[[WidPlayerPrefs objectForKey:@"Enabled"]?:@YES boolValue];
		BOOL newGravityUseInDock = (BOOL)[[WidPlayerPrefs objectForKey:@"UseInDock"]?:@YES boolValue];
		BOOL newGravityEffectGravity = (BOOL)[[WidPlayerPrefs objectForKey:@"EffectGravity"]?:@YES boolValue];
		BOOL newGravityAutomatically = (BOOL)[[WidPlayerPrefs objectForKey:@"ActiveAutomatically"]?:@YES boolValue];
		BOOL newGravityUseAccelerometer = (BOOL)[[WidPlayerPrefs objectForKey:@"UseAccelerometer"]?:@YES boolValue];
		gravityAllowTapIcon = (BOOL)[[WidPlayerPrefs objectForKey:@"AllowTapIcon"]?:@YES boolValue];
		gravityHomeButtonTap = (BOOL)[[WidPlayerPrefs objectForKey:@"HomeButtonTap"]?:@NO boolValue];
		gravityExplosionDock = (BOOL)[[WidPlayerPrefs objectForKey:@"ExplosionDock"]?:@NO boolValue];
		gravityAllowsRotation = (BOOL)[[WidPlayerPrefs objectForKey:@"AllowsRotation"]?:@YES boolValue];
		gravityHideLabelIcon = (BOOL)[[WidPlayerPrefs objectForKey:@"HideLabelIcon"]?:@NO boolValue];
		gravityBounce = (float)[[WidPlayerPrefs objectForKey:@"Bounce"]?:@(0.5) floatValue];
		gravitySpeed = (float)[[WidPlayerPrefs objectForKey:@"Speed.0"]?:@(5.0) floatValue];
		gravityAngularResistance = (float)[[WidPlayerPrefs objectForKey:@"AngularResistance"]?:@(0) floatValue];
		gravityFriction = (float)[[WidPlayerPrefs objectForKey:@"Friction.0"]?:@(0.5) floatValue];
		gravityExplosionForce = (float)[[WidPlayerPrefs objectForKey:@"ExplosionForce"]?:@(1) floatValue];
		gravityGravityForce = (float)[[WidPlayerPrefs objectForKey:@"GravityForce"]?:@(1.0) floatValue];
		gravityMoveIconSwipe = (float)[[WidPlayerPrefs objectForKey:@"MoveIconSwipe"]?:@(4) floatValue];
		gravityMoveIconSplitOut = (float)[[WidPlayerPrefs objectForKey:@"MoveIconSplitOut"]?:@(15) floatValue];
		float newGravityAccelerometerTime = (float)[[WidPlayerPrefs objectForKey:@"AccelerometerTime"]?:@(0.3) floatValue];
		
		BOOL startGravityAtEnd = NO;
		BOOL stopGravityAtEnd = NO;
		BOOL resetGravityAtEnd = NO;
		@try {
		if(myMotionIstanceNew != nil) {
			myMotionIstanceNew.itemBehaviour.elasticity = gravityBounce;
			myMotionIstanceNew.itemBehaviour.friction = gravityFriction;
			myMotionIstanceNew.itemBehaviour.resistance = gravitySpeed;
			myMotionIstanceNew.itemBehaviour.allowsRotation = gravityAllowsRotation;
			if(myMotionIstanceNew.gravity != nil) {
				myMotionIstanceNew.gravity.magnitude = gravityGravityForce;
			}
		}
		if(myMotionIstanceNewDock != nil) {
			myMotionIstanceNewDock.itemBehaviour.elasticity = gravityBounce;
			myMotionIstanceNewDock.itemBehaviour.friction = gravityFriction;
			myMotionIstanceNewDock.itemBehaviour.resistance = gravitySpeed;
			myMotionIstanceNewDock.itemBehaviour.allowsRotation = gravityAllowsRotation;
			if(myMotionIstanceNewDock.gravity != nil) {
				myMotionIstanceNewDock.gravity.magnitude = gravityGravityForce;
			}
		}
		if(gravityEnabled != newGravityEnabled) {
			gravityEnabled = newGravityEnabled;
			if(myMotionIstanceNew != nil && gravityFirstLaunch) {
				if(gravityEnabled) {
					startGravityAtEnd = YES;
				} else {
					stopGravityAtEnd = YES;
				}
			}
		}
		if(gravityUseAccelerometer != newGravityUseAccelerometer) {
			gravityUseAccelerometer = newGravityUseAccelerometer;
			if(myMotionIstanceNew != nil && gravityFirstLaunch) {
				if(gravityUseAccelerometer) {
					stopGravityAtEnd = YES;
					startGravityAtEnd = YES;					
				}
			}
		}
		if(gravityAccelerometerTime != newGravityAccelerometerTime) {
			gravityAccelerometerTime = newGravityAccelerometerTime;
			if(myMotionIstanceNew != nil && gravityFirstLaunch) {
				if(myMotionIstanceNew.motionManager != nil && gravityUseAccelerometer) {
					myMotionIstanceNew.motionManager.accelerometerUpdateInterval = gravityAccelerometerTime;
				}
			}
		}
		if(gravityAutomatically != newGravityAutomatically) {
			gravityAutomatically = newGravityAutomatically;
			if(gravityFirstLaunch) {
				if(gravityEnabled&&gravityAutomatically) {
					startGravityAtEnd = YES;
				} else {
					resetGravityAtEnd = YES;
				}
			}			
		}
		if(!gravityFirstLaunch) {
			isEnabledEffect = gravityAutomatically;
		}
		if(gravityEffectGravity != newGravityEffectGravity) {
			gravityEffectGravity = newGravityEffectGravity;
			if(gravityEnabled) {
				startGravityAtEnd = YES;
			}
		}
		if(gravityUseInDock != newGravityUseInDock) {
			gravityUseInDock = newGravityUseInDock;
			if(myMotionIstanceNew != nil && gravityFirstLaunch) {
				if(gravityEnabled&&gravityUseInDock) {
					startGravityAtEnd = YES;
				} else {
					resetGravityAtEnd = YES;
				}
			}
		}
		if(stopGravityAtEnd) {
			[[%c(SBIconController) sharedInstance] restoreFrameGravity];
		}
		if( (gravityEnabled&&startGravityAtEnd&&gravityFirstLaunch) && gravityAutomatically) {
			[[%c(SBIconController) sharedInstance] startGravityCall];
		}
		if( (resetGravityAtEnd&&gravityFirstLaunch) ) {
			[[%c(SBIconController) sharedInstance] restoreFrameGravity];
		}
		gravityFirstLaunch = YES;
		} @catch (NSException * e) {
		}
	}
}
static void lockScreenStateGravity(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	@autoreleasepool {
		int token;
		uint64_t isLocked;
		notify_register_check("com.apple.springboard.lockstate", &token);
		notify_get_state(token, &isLocked);
		notify_cancel(token);
		if(!isLocked) {
			isDeviceUnlocked = YES;
			gravityNotFirstUnlock = YES;
			if(gravityEnabled) {
				if(gravityAutomatically&&!isEnabledEffect) {
					[[%c(SBIconController) sharedInstance] performSelector:@selector(startGravityCall) withObject:nil afterDelay:2];
				}				
			}
		} else {
			isDeviceUnlocked = NO;
			if(isEnabledEffect) {
				[[%c(SBIconController) sharedInstance] restoreFrameGravity];
			}			
		}
	}
}
/*%hook SBUIController
-(void)finishLaunching{
	%orig;
	NSLog(@"********** -(void)finishLaunching");
	Class SBIconClass = objc_getClass("SBIconController");
	Method originalMethod = class_getInstanceMethod(SBIconClass, @selector(handleHomeButtonTap));
	Method categoryMethod = class_getInstanceMethod(SBIconClass, @selector(gravityHandleHomeButtonTap));
	method_exchangeImplementations(originalMethod, categoryMethod);
}
%end*/
__attribute__((constructor)) static void initialize_Gravity()
{
	@autoreleasepool {
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, settingsChangedGravity, CFSTR("com.julioverne.gravity/Settings"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, lockScreenStateGravity, CFSTR("com.apple.springboard.lockstate"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
		settingsChangedGravity(NULL, NULL, NULL, NULL, NULL);
		[[GravityActivator sharedInstance] RegisterActions];
	}
}