# hasDynamcIsland 
Detect if a device has the Dynamic Island.

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(green)
}

## Overview

`hasDynamicIsland` is a property of [`ByDevice`](<doc:ByDevice>) that can provide a non-hardcoded boolean value of whether or not a device has the Dynamic Island

> Warning: It is unknown when this property of `ByDevice` was added, and to which operating systems, testing is required before production use. `ByDevice` and/or `hasDynamicIsland` may be removed at any time.

## Method

We can use this code to get the future-proof boolean:
```swift
let BYDeviceClass = NSClassFromString( "BYDevice") as! NSObject.Type
let bydevice = BYDeviceClass.perform(NSSelectorFromString("currentDevice")).takeUnretainedValue() as! NSObject
let hasDynamicIsland = bydevice.value(forKey: "hasDynamicIsland") as! Bool

print(hasDynamicIsland)
```
