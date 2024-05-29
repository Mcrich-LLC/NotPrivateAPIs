# UIMenu
@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "13.0")
    @Available("iPadOS", introduced: "13.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}
A container for grouping related menu elements in an app menu or contextual menu.

## Overview

Create UIMenu objects and use them to construct the menus and submenus your app displays. You provide menus for your app when it runs on macOS, and key command elements in those menus also appear in the discoverability HUD on iPad when someone presses the Command key. You also use menus to display contextual actions in response to specific interactions with one of your views. Every menu has a title, an optional image, and an optional set of child elements. When someone selects an element from the menu, the system executes the code you provide. The code sample below illustrates adding a menu group that contains two menu elements — New and Open — to the File menu.

```swift
// Ensure that the builder is modifying the menu bar system.
guard builder.system == UIMenuSystem.main else { return }


let newDocument = UIKeyCommand(title: "New",
                               action: #selector(newDocument(_:)),
                               input: "n",
                               modifierFlags: .command)


let openDocument = UIKeyCommand(title: "Open...",
                                action: #selector(openDocument(_:)),
                                input: "o",
                                modifierFlags: .command)


// Use the .displayInline option to avoid displaying the menu as a submenu,
// and to separate it from the other menu elements using a line separator.
let newMenu = UIMenu(title: "", options: .displayInline, children: [newDocument, openDocument])


// Insert the menu item at the top of the File menu.
builder.insertChild(newMenu, atStartOfMenu: .file)
```
For examples of how you use UIMenu, see [Adding Menus and Shortcuts to the Menu Bar and User Interface](https://developer.apple.com/documentation/uikit/uicommand/adding_menus_and_shortcuts_to_the_menu_bar_and_user_interface).

Full Documentation [Here](https://developer.apple.com/documentation/uikit/uimenu)

## Topics

- <doc:UICustomViewMenuElement>
