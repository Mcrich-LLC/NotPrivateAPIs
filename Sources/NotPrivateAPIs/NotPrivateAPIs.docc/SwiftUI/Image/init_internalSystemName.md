# init(_internalSystemName:)

Creates an image from a system symbol name, allowing access to internal symbols.

@Metadata {
    @TitleHeading("Initializer")
    @PageColor(red)
}

## Overview

This initializer allows you to create an `Image` using a system symbol name, akin to `Image(systemName:)`. However, unlike the public API, this initializer allows access to internal/private system symbols that are not publicly exposed. See [PrivateSymbols](https://github.com/quentinfasquel/PrivateSymbols) for discovering private symbols.

### Parameters

- `internalSystemName`: The name of the system symbol to load.

## Example

You can use this initializer directly as it is publicly accessible, despite being intended for internal use.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        // Example: Using a private symbol
        Image(_internalSystemName: "apple.visual.intelligence")
    }
}
```

## Credits

 - [ビスター(Vistar)](https://x.com/Lmssync)
