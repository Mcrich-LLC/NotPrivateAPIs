# UITextView

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "2.0")
    @Available("iPadOS", introduced: "2.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
}
A scrollable, multiline text region.

## Overview
UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
This class supports multiple text styles through use of the [`attributedText`](https://developer.apple.com/documentation/uikit/uitextview/1618626-attributedtext) property. (Styled text isn’t supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the [`font`](https://developer.apple.com/documentation/uikit/uitextview/1618600-font), [`textColor`](https://developer.apple.com/documentation/uikit/uitextview/1618601-textcolor), and [`textAlignment`](https://developer.apple.com/documentation/uikit/uitextview/1618618-textalignment) properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a [`UIWebView`](https://developer.apple.com/documentation/uikit/uiwebview) object—to display both plain and rich text in your app.

### Manage the keyboard
When the user taps in an editable text view, that text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it’s up to you to make sure that doesn’t happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the first responder is at the bottom of the scrolling region, however, you may still need to resize or reposition the scroll view itself to ensure the first responder is visible.
It’s your application’s responsibility to dismiss the keyboard at the time of your choosing. You might dismiss the keyboard in response to a specific user action, such as the user tapping a particular button in your user interface. To dismiss the keyboard, send the [`resignFirstResponder()`](https://developer.apple.com/documentation/uikit/uiresponder/1621097-resignfirstresponder) message to the text view that’s currently the first responder. Doing so causes the text view object to end the current editing session (with the delegate object’s consent) and hide the keyboard.
The appearance of the keyboard itself can be customized using the properties provided by the [`UITextInputTraits`](https://developer.apple.com/documentation/uikit/uitextinputtraits) protocol. Text view objects implement this protocol and support the properties it defines. You can use these properties to specify the type of keyboard (ASCII, Numbers, URL, Email, and others) to display. You can also configure the basic text entry behavior of the keyboard, such as whether it supports automatic capitalization and correction of the text.

### Keyboard notifications
When the system shows or hides the keyboard, it posts several keyboard notifications. These notifications contain information about the keyboard, including its size, which you can use for calculations that involve repositioning or resizing views. Registering for these notifications is the only way to get some types of information about the keyboard. The system delivers the following notifications for keyboard-related events:
- [`keyboardWillShowNotification`](https://developer.apple.com/documentation/uikit/uiresponder/1621576-keyboardwillshownotification)
- [`keyboardDidShowNotification`](https://developer.apple.com/documentation/uikit/uiresponder/1621602-keyboarddidshownotification)
- [`keyboardWillHideNotification`](https://developer.apple.com/documentation/uikit/uiresponder/1621606-keyboardwillhidenotification)
- [`keyboardDidHideNotification`](https://developer.apple.com/documentation/uikit/uiresponder/1621579-keyboarddidhidenotification)
For more information about these notifications, see their descriptions in [`UIWindow`](https://developer.apple.com/documentation/uikit/uiwindow).

### State preservation
In iOS 6 and later, if you assign a value to this view’s [`restorationIdentifier`](https://developer.apple.com/documentation/uikit/uiview/1622494-restorationidentifier) property, it preserves the following information:
- The selected range of text, as reported by the [`selectedRange`](https://developer.apple.com/documentation/uikit/uitextview/1618615-selectedrange) property.
- The editing state of the text view, as reported by the [`isEditable`](https://developer.apple.com/documentation/uikit/uitextview/1618616-iseditable) property.
During the next launch cycle, the view attempts to restore these properties to their saved values. If the selection range can’t be applied to the text in the restored view, no text is selected. For more information about how state preservation and restoration works, see [App Programming Guide for iOS](https://developer.apple.com/library/archive/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007072).
For design guidance, see [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/components/content/text-views/).

## Topics

- <doc:setAttributedPlaceholder>
