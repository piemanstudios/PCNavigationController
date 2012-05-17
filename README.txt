This is an alternative to Apple's UINavigationController for the iPad.

It is simple to use; drop the 8 files into your project and initialise a PCNavigationController object along with a root view controller as you would with a UINavigationController.

Then simply treat it as a UINavigationController; you call [self.navigationController pushViewController:] etc to push/pop view controllers.

To set the navigation title, again use [self.navigationItem setTitle:@"Title"]

An example is included in the project to get you going- feel free to replace the artwork (the navigationItems may need to be resized if you do this).