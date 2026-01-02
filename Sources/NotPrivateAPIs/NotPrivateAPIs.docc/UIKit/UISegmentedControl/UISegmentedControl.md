# UISegmentedControl
A horizontal control that consists of multiple segments, each segment functioning as a discrete button.

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

A segmented control can display a title (an [`NSString`](https://developer.apple.com/documentation/Foundation/NSString) object) or an image ([`UIImage`](https://developer.apple.com/documentation/uikit/uiimage) object). The [`UISegmentedControl`](https://developer.apple.com/documentation/uikit/uisegmentedcontrol) object automatically resizes segments to fit proportionally within their superview unless they have a specific width set. When you add and remove segments, you can request that the action be animated with sliding and fading effects.

You register the target-action methods for a segmented control using the [`valueChanged`](https://developer.apple.com/documentation/uikit/uicontrol/event/valuechanged) constant as shown below.

@TabNavigator {
    @Tab("Swift") {
        ```swift
        segmentedControl.addTarget(self, action: "action:", forControlEvents: .valueChanged)
        ```
    }

    @Tab("Objective-C") {
        ```objc
        [segmentedControl addTarget:self
                     action:@selector(action:)
           forControlEvents:UIControlEventValueChanged];

        ```
    }
}

How you configure a segmented control can affect its display behavior:

- If you set a segmented control to have a momentary style, a segment doesn’t show itself as selected (blue background) when the user touches it. The disclosure button is always momentary and doesn’t affect the actual selection.    
- In versions of iOS prior to 3.0, if a segmented control has only two segments, then it behaves like a switch — tapping the currently-selected segment causes the other segment to be selected. In iOS 3.0 and later, tapping the currently-selected segment doesn’t cause the other segment to be selected.

Full Documentation [Here](https://developer.apple.com/documentation/uikit/uisegmentedcontrol)

## Topics

- <doc:_setUseGlass>
