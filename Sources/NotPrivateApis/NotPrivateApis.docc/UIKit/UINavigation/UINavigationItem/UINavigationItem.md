# UINavigationItem

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "2.0")
    @Available("iPadOS", introduced: "2.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}
The items that a navigation bar displays when the associated view controller is visible.

## Overview
When building a navigation interface, each view controller that you push onto the navigation stack must have a UINavigationItem object that contains the buttons and views you want to display in the navigation bar. The managing [`UINavigationController`](https://developer.apple.com/documentation/uikit/uinavigationcontroller) object uses the navigation items of the topmost two view controllers to populate the navigation bar with content.
A navigation item always reflects information about its associated view controller. The navigation item must provide a title to display when the view controller is topmost on the navigation stack. The item can also contain additional buttons to display on the right (or trailing) side of the navigation bar. You can specify buttons and views to display on the left (or leading) side of the toolbar using the [`leftBarButtonItems`](https://developer.apple.com/documentation/uikit/uinavigationitem/1624946-leftbarbuttonitems) property, but the navigation controller displays those buttons only when space is available.
The [`backBarButtonItem`](https://developer.apple.com/documentation/uikit/uinavigationitem/1624958-backbarbuttonitem) property of a navigation item reflects the Back button you want to display when the current view controller is just below the topmost view controller. The Back button doesn’t appear when the current view controller is topmost.
When specifying buttons for a navigation item, you must use [`UIBarButtonItem`](https://developer.apple.com/documentation/uikit/uibarbuttonitem) objects. If you want to display custom views in the navigation bar, you must wrap those views inside a [`UIBarButtonItem`](https://developer.apple.com/documentation/uikit/uibarbuttonitem) object before adding them to the navigation item.

## Topics

- <doc:__largeTitleTwoLineMode>
