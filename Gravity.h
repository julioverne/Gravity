#import <mach-o/dyld.h>
#import <dlfcn.h>
#import <objc/runtime.h>
#import <notify.h>
#import <substrate.h>

#import <CoreMotion/CoreMotion.h>

#define PLIST_PATH_Settings "/var/mobile/Library/Preferences/com.julioverne.gravity.plist"


@interface GravityPanGestureRecognizer : UIPanGestureRecognizer
{
	BOOL isDock;
}
@property (nonatomic, assign) BOOL isDock;
@end

@interface GravityPushBehavior : UIPushBehavior
@end

@interface GravityDynamicItemBehavior : UIDynamicItemBehavior
@end

@interface GravityDKCollisionBehavior : UICollisionBehavior
@end

@interface GravityCollisionBehavior : UICollisionBehavior
@end

@interface GravityDynamicAnimator : UIDynamicAnimator
{
	CGRect myFrame;
}
@property (nonatomic, assign) CGRect myFrame;
@end

@interface PKPhysicsBody : NSObject
@property (nonatomic) CGPoint position;
@end

@interface PKPhysicsContact : NSObject
@property (nonatomic, readonly) PKPhysicsBody *bodyA;
@property (nonatomic, readonly) PKPhysicsBody *bodyB;
@end

@interface myMotion : NSObject
{
	GravityDynamicAnimator* animator;
	GravityCollisionBehavior *collision;
	GravityDKCollisionBehavior *collisionDK;
	CMMotionManager* motionManager;
	UIGravityBehavior *gravity;
	GravityDynamicItemBehavior* itemBehaviour;
	int orientation;
}
@property (nonatomic, strong) GravityDynamicAnimator* animator;
@property (nonatomic, strong) GravityCollisionBehavior *collision;
@property (nonatomic, strong) CMMotionManager* motionManager;
@property (nonatomic, strong) GravityDKCollisionBehavior *collisionDK;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) GravityDynamicItemBehavior* itemBehaviour;
@property (nonatomic, assign) int orientation;
- (CGRect)frame;
- (CMMotionManager *)motionHere;
- (GravityDynamicAnimator*)animatorHere:(UIView*)view;
- (UIGravityBehavior*)gravityHere:(NSArray*)item;
- (GravityCollisionBehavior*)collisionHere:(NSArray*)item;
- (GravityDKCollisionBehavior*)collisionDKHere:(NSArray*)item;
- (GravityDynamicItemBehavior*)itemBehaviourHere:(NSArray*)item;
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(UIView*)item1 withItem:(UIView*)item2 atPoint:(CGPoint)p;
@end

@interface GravityActivator : NSObject
+ (id)sharedInstance;
- (void)RegisterActions;
@end

@interface SBIconImageView : UIView
@end

@interface _UILegibilityView : UIView
@end


@interface SBFolder : NSObject
- (BOOL)isOpen;
@end

@interface SBIconViewMap
+ (SBIconViewMap *)homescreenMap;
- (id)mappedIconViewForIcon:(id)arg1;
- (id)iconViewForIcon:(id)icon;
- (id)iconModel;
- (void)_modelReloadedState;
- (void)_modelReloadedIcons;
@end

@interface SBIcon : NSObject
-(id)applicationBundleID;
-(BOOL)isApplicationIcon;
-(id)folderFallbackTitle;
-(BOOL)isFolderIcon;
@end

@interface SBIconView : UIView
{
	SBIconImageView *_iconImageView;
}
@property(retain, nonatomic) SBIcon* icon;
+ (CGSize)defaultIconImageSize;
+ (CGSize)defaultIconSize;
- (BOOL)isInDock;
- (SBIconImageView *)_iconImageView;
@end

@interface SBIconListView : UIView
-(void)setIconsNeedLayout;
-(void)layoutIconsIfNeeded:(double)needed domino:(BOOL)domino;
-(CGPoint)centerForIcon:(id)icon;
-(CGPoint)originForIcon:(id)icon;
-(CGPoint)originForIconAtIndex:(unsigned)index;
-(CGSize)defaultIconSize;
@end

@interface SBRootIconListView : SBIconListView {
}
- (SBFolder*)folder;
- (NSArray *)icons;
- (unsigned long long)indexOfIcon:(id)icon;
@end

@interface SBIconModel : NSObject
- (id)iconState;
@end


@interface SBIconController : NSObject


- (void)handlePanGravity:(GravityPanGestureRecognizer*)panGesture;
- (void)startGravityCall;
- (void)startGravity;
- (void)startGravityDock;
- (void)restoreFrameGravity;
- (void)explosionGravity;



+ (id)sharedInstance;

- (SBIconModel*)model;

-(id)folderIconListAtIndex:(unsigned)index;
-(id)rootIconListAtIndex:(int)index;
-(int)currentFolderIconListIndex;
-(int)currentIconListIndex;

- (int)viewMap:(id)map locationForIcon:(id)icon;
- (SBRootIconListView*)currentFolderIconList;
- (SBRootIconListView*)dockListView;
- (SBRootIconListView*)currentRootIconList;
- (int)orientation;
- (void)clearHighlightedIcon;
- (void)noteIconStateChangedExternally;
- (BOOL)hasOpenFolder;
@end

@interface SBIconScrollView : NSObject
@end
