# UINavigationController
A container view controller that defines a stack-based scheme for navigating hierarchical content.

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "2.0")
    @Available("iPadOS", introduced: "2.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS)
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}

## Overview

A navigation controller is a container view controller that manages one or more contained view controllers in a navigation interface. In this type of interface, only one contained view controller is visible at a time. Selecting an item in the view controller pushes a new view controller onscreen using an animation, hiding the previous view controller. Tapping the back button in the navigation bar at the top of the interface removes the top view controller, thereby revealing the view controller underneath.

Use a navigation interface to mimic the organization of hierarchical data managed by your app. At each level of the hierarchy, you provide an appropriate screen (managed by a custom view controller) to display the content at that level. The following image shows an example of the navigation interface presented by the Settings application in a simulated iOS device. The first screen presents the user with the list of groups that organize preferences. Selecting a group reveals individual settings and groups of settings for that application. For all but the root view, the navigation controller provides a back button to allow the user to move back up the hierarchy.

Full Documentation [Here](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

## Topics

- <doc:_setNavigationBarHidden>
