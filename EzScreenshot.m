#import "EzScreenshot.h" //Importing a header file that defines or calls properties, classes, or objects we are going to use.

@interface UIImage () //Interfacing UIImage.
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle; //Create an UIImage instance from a named picture in our NSBundle. [#1]
@end //Leaving no trace of us opening UIImage.

@implementation EzScreenshot //Remember, implementation allows us to set actual code.
- (UIImage *)iconGlyph { //Create an instance of UIImage called "iconGlyph."
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]]; //Returning our "iconGlyph" with parameters we set. [#2]
} //This is kind of like @end, except for methods. Tell the system we do not need this function anymore. (Remember, you need to open with a bracket to set code!)

- (UIColor *)selectedColor { //Create an instance of UIColor called "selectedColor."
	return [UIColor pinkishColor]; //We are returning our pinkishColor we set earlier. This means that whenever the "selectedColor" is called, it will be our pretty pink.
}

- (BOOL)isSelected { //Hooking or setting our BOOL, isSelected, with actual code to run.
	if (self.EzScreenshotToggle) { //Check if the EzScreenshotToggle BOOL is true. [#3]
		self.EzScreenshot = YES; //Set EzScreenshot to yes.
	} else { //An else statement. Pretty easy to understand. If EzScreenshotToggle is not true or enabled.
		self.EzScreenshot = NO; //Set EzScreenshot to no.
	}
	return self.EzScreenshot; //Return the value of EzScreenshot to isSelected.
}

- (void)setSelected:(BOOL)selected { //This is a void function that has a BOOL as a parameter.
	self.EzScreenshotToggle = YES; //Set the specified toggle to true.
	if (self.EzScreenshotToggle) { //Again, checking if it is true.
		selected = YES; //Set selected, which is the specific parameter for this function.
		self.EzScreenshot = selected; //Set another bool the same as selected.
		[super refreshState]; //This method tells our toggle to refresh or reload. [#4]
		[self performSelector:@selector(takeScreenshot1)  withObject:nil afterDelay:0.5]; //Tell the system to now run another method after a period of 0.5 seconds.
	} else { //If the BOOL was not true. (EzScreenshotToggle)
		selected = NO; //Set it to false.
		self.EzScreenshot = selected; //Again, make sure it is the same.
		[super refreshState]; //Reload the toggle.
	}
}

- (void)takeScreenshot1 { //The first part to a two-part function. There is probably a better way to do this, but this is just an example - hey, it works anyway.
	[[objc_getClass("SBControlCenterController") sharedInstance] dismissAnimated:TRUE]; //Call the class' method, "dismissAnimated:".
	[self performSelector:@selector(takeScreenshot2)  withObject:nil afterDelay:1.5]; //Call part two after a delay.
}
- (void)takeScreenshot2 { //Last method of our class.
	[[[objc_getClass("SBScreenshotManager") alloc] initWithDataSource:[[objc_getClass("SBScreenshotManagerDataSource") alloc] init]] saveScreenshots]; //In a nutshell, it basically just calls the save code.
	self.EzScreenshotToggle = NO; //Disable the toggle.
}
@end //Our code is done!

//EXTRA INFORMATION
//
//  [#1]: "(UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle"
//      - This may seem scary, but it is easy. Functions may have multiple parameters.
//      		- "imageNamed:", find the image called this (in the form of a string.)
//					= "inBundle:", a bundle is the package and location the class or project is located in.
//
//  [#2]: Using "return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];"
//      - This is pretty much explained in [#1]. Here, we just set our cryteria to define what we want.
//
//	[#3]: Occurance of "self".
//			- "self" is the term of calling a method or object within the same class.
//
//	[#4]: "super".
//			- Similar to "self." Here, "super" is referring to the toggle and calls the refresh method.
//
// Programmed/Sourced by iOSCreatix (Andrew Wiik)
// Specific Programming and Documentation by Simalary (Chris Harper)
