#import <ControlCenterUIKit/CCUIToggleModule.h> //Importing this header allows us to call CCUIToggleModule functions.
#import <objc/runtime.h> //Importing this header allows us to call a function to get Objective-C class names.

// MODULE SPECIC CONTENT

@interface EzScreenshot : CCUIToggleModule //Interfacing this class allows us to add our own subclass (or division) without affecting other objects that use the original. [#1]
@property (nonatomic, assign, readwrite) BOOL EzScreenshot; //Creating a custom BOOL we can use.
@property (nonatomic, assign, readwrite) BOOL EzScreenshotToggle; //Creating a custom BOOL we can use.
@end //Ending an interface tells the compiler we are done changing or adding properties.

@implementation UIColor (EzScreenshotModule) //Implementing the UIColor class will allow us to add our own color in a clean manner. [#2]
+(UIColor *) pinkishColor { return [UIColor colorWithRed:0.70 green:0.10 blue:0.35 alpha:1.0]; }
@end //Again, ending. Remind the compiler we no longer need to implement this class.

//SCREENSHOT HANDLING
@interface SBScreenshotManagerDataSource : NSObject //Interfacing this class alows us to declare methods and other objects.
@end //Just cleaning up.

@interface SBScreenshotManager : NSObject //Again: interfacing
+(id)initWithDataSource:(id)arg1; //Mentioning this here will allow us to use it later. It seems this allows us to define where the screenshot comes from and what object causes it.
+(void)saveScreenshots; //Bringing this up allows us to call it later in actual code. Usually void/method names are self-explanatory.
+(void)saveScreenshotsWithCompletion:(id)arg1; //Some classes have multiple methods that may do the same thing. This is not used in EzScreenshot, but is left here as another example.
@end //Sweeping left and right.

//CONTROL CENTER STUFF
@interface SBControlCenterController //Again, import/interface a class to use its methods.
+(id)sharedInstance; //A shared instance is basically defining a certain entity. If it is available, use that copy.
+(void)dismissAnimated:(BOOL)arg1; //Self-explanatory void method. It appears that this one closes the Control Center automatically. The BOOL tells it to use an animation.
@end //Last speck of class left.


//EXTRA INFORMATION
//
//  [#1]: We see "@interface EzScreenshot : CCUIToggleModule"
//      - In this case, we are creating a class, EzScreenshot, that is copied from CCUIToggleModule.
//      - The new comes after "@interface", and the original comes after the colon.
//
//  [#2]: Using "@implementation"
//      - In this implementation, we are using UIColor to define our own in a sleek manner, so we can just call it by the name in code instead of the messy way, showing a bunch of numbers. Create it here so our final code looks more professional.
//      - Implementation blocks contain actual code.
//
// Programmed/Sourced by iOSCreatix (Andrew Wiik)
// Specific Programming and Documentation by Simalary (Chris Harper)
