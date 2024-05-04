# UINavigationBar

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "2.0")
    @Available("iPadOS", introduced: "2.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}
Navigational controls that display in a bar along the top of the screen, usually in conjunction with a navigation controller.

## Overview
A UINavigationBar object is a bar, typically displayed at the top of the window, containing buttons for navigating within a hierarchy of screens. The primary components are a left (back) button, a center title, and an optional right button. You can use a navigation bar as a standalone object or in conjunction with a navigation controller object.
![A diagram that identifies the primary components of a navigation bar, including the back item title that connects to the previous view controller, shown on the left side of the diagram, the top item title of the navigation bar and the navigation bar prompt in the middle, and the right bar button item, with the text Done.](UINavigationBar-Image1)
A navigation bar is most commonly used within a navigation controller. The [`UINavigationController`](https://developer.apple.com/documentation/uikit/uinavigationcontroller) object creates, displays, and manages its associated navigation bar, and uses attributes of the view controllers you add to control the content displayed in the navigation bar.
To control a navigation bar when using a navigation controller, the following steps are required:
- Create a navigation controller in Interface Builder or in the code.
- Configure the appearance of the navigation bar using the [`navigationBar`](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621877-navigationbar) property on the [`UINavigationController`](https://developer.apple.com/documentation/uikit/uinavigationcontroller) object.
- Control the content of the navigation bar by setting the [`title`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621364-title) and [`navigationItem`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621851-navigationitem) properties on each [`UIViewController`](https://developer.apple.com/documentation/uikit/uiviewcontroller) you push onto the navigation controller’s stack.

You can also use a standalone navigation bar, without using a navigation controller. To add a navigation bar to your interface, the following steps are required:
- Set up Auto Layout rules to govern the position of the navigation bar in your interface.
- Create a root navigation item to supply the initial title.
- Configure a delegate object to handle user interactions with the navigation bar.
- Customize the appearance of the navigation bar.
- Configure your app to push and pop relevant navigation items as the user navigates through the hierarchical screens.

### Use a navigation bar with a navigation controller
If you use a navigation controller to manage the navigation between different screens of content, the navigation controller creates a navigation bar automatically and pushes and pops navigation items when appropriate.
A navigation controller uses the [`navigationItem`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621851-navigationitem) property on [`UIViewController`](https://developer.apple.com/documentation/uikit/uiviewcontroller) to provide the model objects to its navigation bar when navigating a stack of view controllers. The default navigation item uses the view controller’s title, but you can override the [`navigationItem`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621851-navigationitem) on a [`UIViewController`](https://developer.apple.com/documentation/uikit/uiviewcontroller) subclass to gain complete control of the navigation bar’s content.
A navigation controller automatically assigns itself as the delegate of its navigation bar object. Therefore, when using a navigation controller, don’t assign a custom delegate object to the corresponding navigation bar.
To access the navigation bar associated with a navigation controller, use the [`navigationBar`](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621877-navigationbar) property on [`UINavigationController`](https://developer.apple.com/documentation/uikit/uinavigationcontroller). See [Customize the appearance of a navigation bar](https://developer.apple.com/documentation/uikit/uinavigationbar#1654191) for details on how to customize the appearance of a navigation bar.
For information about navigation controllers, see [`UINavigationController`](https://developer.apple.com/documentation/uikit/uinavigationcontroller).

### Add content to a standalone navigation bar
In the vast majority of scenarios you use a navigation bar as part of a navigation controller. However, there are situations for which you might want to use the navigation bar UI and implement your own approach to content navigation. In these situations, you can use a standalone navigation bar.
When you use a navigation bar as a standalone object, you’re responsible for providing its content. Unlike other types of views, you don’t add subviews to a navigation bar directly. Instead, you use a navigation item (an instance of the [`UINavigationItem`](https://developer.apple.com/documentation/uikit/uinavigationitem) class) to specify what buttons or custom views you want displayed. A navigation item has properties for specifying views on the left, right, and center of the navigation bar and for specifying a custom prompt string.
A navigation bar manages a stack of [`UINavigationItem`](https://developer.apple.com/documentation/uikit/uinavigationitem) objects. Although the stack is there mostly to support navigation controllers, you can use it to implement your own custom navigation interface. The topmost item in the stack represents the navigation item whose contents are currently displayed by the navigation bar. You push new navigation items onto the stack using the [`pushItem(_:animated:)`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624952-pushitem) method and pop items off the stack using the [`popItem(animated:)`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624969-popitem) method. Both of these changes can be animated for the benefit of the user.
In addition to pushing and popping items, you can also set the contents of the stack directly using either the [`items`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624961-items) property or the [`setItems(_:animated:)`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624945-setitems) method. You might use this method at launch time to restore your interface to its previous state or to push or pop more than one navigation item at a time. The following figure shows the part of the [`UINavigationBar`](https://developer.apple.com/documentation/uikit/uinavigationbar) API responsible for managing the stack of navigation items.
![A flowchart diagram of the navigation bar and a stack of navigation items. A new navigation item enters the navigation bar from the left side of the diagram. In the center, the UINavigationBar contains properties that provide access to items in the stack, and methods that allow mutation by pushing on and popping off the stack, depicted on the right of the diagram.](UINavigationBar-Image2)
If you’re using a navigation bar as a standalone object, assign a custom delegate object to the [`delegate`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624951-delegate) property and use that object to intercept messages coming from the navigation bar. Delegate objects must conform to the [`UINavigationBarDelegate`](https://developer.apple.com/documentation/uikit/uinavigationbardelegate) protocol. The delegate notifications let you track when navigation items are pushed or popped from the stack. You use these notifications to update the rest of your app’s user interface.
For more information about creating navigation items, see [`UINavigationItem`](https://developer.apple.com/documentation/uikit/uinavigationitem). For more information about implementing a delegate object, see [`UINavigationBarDelegate`](https://developer.apple.com/documentation/uikit/uinavigationbardelegate).

### Customize the appearance of a navigation bar
Navigation bars have two standard appearance styles: white with dark text or black with light text. Use the [`barStyle`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624955-barstyle) property to select the style. Any changes you make to other navigation bar appearance properties override those inferred from the bar style.
Navigation bars are translucent by default; their background color is semitransparent. You can make the navigation bar opaque by setting the [`isTranslucent`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624928-istranslucent) property to false.
You can specify a custom tint color for a navigation bar background using the [`barTintColor`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624931-bartintcolor) property. Setting this property overrides the default color inferred from the bar style. As with all [`UIView`](https://developer.apple.com/documentation/uikit/uiview) subclasses, you can control the color of the interactive elements within navigation bars, including button images and titles, using the [`tintColor`](https://developer.apple.com/documentation/uikit/uiview/1622467-tintcolor) property.
The [`titleTextAttributes`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624953-titletextattributes) property specifies the attributes for displaying the bar’s title text. You can specify the font, text color, text shadow color, and text shadow offset for the title in the text attributes dictionary using the [`font`](https://developer.apple.com/documentation/foundation/nsattributedstring/key/1528839-font), [`foregroundColor`](https://developer.apple.com/documentation/foundation/nsattributedstring/key/1533563-foregroundcolor), and [`shadow`](https://developer.apple.com/documentation/foundation/nsattributedstring/key/1524321-shadow) keys, respectively. For more information about string-formatting attributes, see Character Attributes.
Use the [`setTitleVerticalPositionAdjustment(_:for:)`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624959-settitleverticalpositionadjustme) method to adjust the vertical position of the title. This method allows you to specify the adjustment dependent on the bar height, which is represented by the [`UIBarMetrics`](https://developer.apple.com/documentation/uikit/uibarmetrics) enum. The following figure shows a navigation bar with custom tint color, title text attributes, and bar tint color.

![A navigation bar diagram that depicts the fonts, color, and layout of a navigation bar, including the tint color, title text attributes, bar tint color, and the title vertical position.](UINavigationBar-Image3)

To allow complete customization over the appearance of navigation bars, you can additionally provide custom background and shadow images. To provide a custom background image, use the [`setBackgroundImage(_:for:barMetrics:)`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624968-setbackgroundimage) method, providing a [`UIImage`](https://developer.apple.com/documentation/uikit/uiimage) object for the appropriate bar position and metrics values. Use a [`UIBarPosition`](https://developer.apple.com/documentation/uikit/uibarposition) value for the bar position argument to specify whether to use the supplied image at the bottom or the top of the window, and if it appears at the top, whether to extend it upward under the status bar. Similarly, you can specify that the image should be used for either compact or default bar metrics, with or without a prompt, by providing a [`UIBarMetrics`](https://developer.apple.com/documentation/uikit/uibarmetrics) value to the bar metrics argument.
To add a shadow, provide a resizable [`UIImage`](https://developer.apple.com/documentation/uikit/uiimage) to the [`shadowImage`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624963-shadowimage) property. To use the custom shadow image, you need to have specified a custom background image. The following figure shows a navigation bar with a custom background image, supplied using [`setBackgroundImage(_:for:barMetrics:)`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624968-setbackgroundimage) with a bar position value of [`UIBarPosition.topAttached`](https://developer.apple.com/documentation/uikit/uibarposition/topattached) and a bar metrics value of [`UIBarMetrics.default`](https://developer.apple.com/documentation/uikit/uibarmetrics/default). A custom image has also been provided to the [`shadowImage`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624963-shadowimage) property.

![A screenshot of a navigation bar with the location of a background image and a shadow image labeled.](UINavigationBar-Image4)

To see examples of customizing a navigation bar, see [Customizing Your App’s Navigation Bar](https://developer.apple.com/documentation/uikit/uinavigationcontroller/customizing_your_app_s_navigation_bar).

### Customize a navigation bar with Interface Builder
The following table lists the core attributes that you configure for navigations bars in the Attributes Inspector within Interface Builder.

Attribute      | Description                          
------------   | ------------------------------------- 
Style        | Specifies the UI bar style to apply to the navigation bar. The bar style controls the title color and the bar tint color, but you can override it by providing values for those attributes. Select Translucent to make the navigation bar semitransparent. Access these values at runtime with the [`barStyle`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624955-barstyle) and [`isTranslucent`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624928-istranslucent) properties.
Bar Tint     | Controls the tint color of the navigation bar. This overrides the value implied by the Style attribute. If the Translucent attribute is selected, the Bar Tint color is automatically made semitransparent. Access this value at runtime with the [`barTintColor`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624931-bartintcolor) property.
Shadow Image | Represents the image used as a shadow beneath the navigation bar. This image is stretched horizontally to match the width of the bar. Access this value at runtime with the [`shadowImage`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624963-shadowimage) property.
Back Image   | Specifies the image that appears at the leading edge of the back button. This attribute must be used in combination with the Back Mask attribute. Access this value at runtime with the [`backIndicatorImage`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624942-backindicatorimage) property.
Back Mask   | Specifies the mask associated with the Back Image attribute. This is used to control the appearance of the Back button during animated transitions, and therefore must be used in conjunction with the Back Image attribute. Access this value at runtime with the [`backIndicatorTransitionMaskImage`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624938-backindicatortransitionmaskimage) property.

The following table lists the Interface Builder attributes that affect the appearance of the navigation bar’s title.

Attribute      | Description                          
------------   | ------------------------------------- 
Title Font     | The font used to render the title in the center of the navigation bar. Access this value at runtime with the value stored against the [`font`](https://developer.apple.com/documentation/foundation/nsattributedstring/key/1528839-font) key in the dictionary in the [`titleTextAttributes`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624953-titletextattributes) property.
Title Color    | The color used to render the navigation bar title. Access this value at runtime using the [`foregroundColor`](https://developer.apple.com/documentation/foundation/nsattributedstring/key/1533563-foregroundcolor) key in the dictionary in the [`titleTextAttributes`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624953-titletextattributes) property.
Title Shadow   | Specifies the color and offset of the shadow used when rendering the navigation bar’s title. Access these values at runtime with the dictionary in the [[`titleTextAttributes`](https://developer.apple.com/documentation/uikit/uinavigationbar/1624953-titletextattributes)] property, using the [`shadow`](https://developer.apple.com/documentation/foundation/nsattributedstring/key/1524321-shadow) key.

### Internationalize a navigation bar
To internationalize navigation bars, specify a localized string for each of the displayed string properties of the navigation item model objects.
For more information about internationalizing your interface, see [Internationalization and Localization Guide](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/Introduction/Introduction.html#//apple_ref/doc/uid/10000171i).

### Make a navigation bar accessible
Navigation bars are accessible by default. The default accessibility trait for a navigation bar is User Interaction Enabled.
With VoiceOver enabled on an iOS device, after the user navigates to a new view in the hierarchy, VoiceOver reads the navigation bar’s title, followed by the name of the left bar button item. When the user taps an element in a navigation bar, VoiceOver reads the name and the type of the element; for example, "General back button," "Keyboard heading," and "Edit button."
For general information about making your interface accessible, see [Accessibility Programming Guide for iOS](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/iPhoneAccessibility/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008785).

## Topics

- <doc:_accessoryView>
- <doc:_UINavigationBarPalette>
