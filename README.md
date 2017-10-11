# YNDropDownMenu

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
[![Version](https://img.shields.io/cocoapods/v/YNDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/YNDropDownMenu)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Docs](https://github.com/younatics/YNDropDownMenu/blob/master/docs/badge.svg)](https://younatics.github.io/YNDropDownMenu/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/younatics/YNDropDownMenu/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/younatics/YNDropDownMenu.svg?branch=master)](https://travis-ci.org/younatics/YNDropDownMenu)
[![Platform](https://img.shields.io/cocoapods/p/YNDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/YNDropDownMenu)
[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)

## Updates
See [CHANGELOG](https://github.com/younatics/YNDropDownMenu/blob/master/CHANGELOG.md) for details

## Intoduction
The eligible dropdown menu for iOS, written in Swift 4, appears dropdown menu to display a view of related items when a user click on the dropdown menu. You can customize dropdown view whatever you like (e.g. UITableView, UICollectionView... etc)

![demo](https://github.com/younatics/YNDropDownMenu/blob/master/Images/YNDropDownMenu.gif?raw=true)
![demo2](https://github.com/younatics/YNDropDownMenu/blob/master/Images/YNDropDownMenu2.gif?raw=true)

## Requirements

`YNDropDownMenu` written in Swift 4. Compatible with iOS 8.0+

## Installation

### Cocoapods

YNDropDownMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YNDropDownMenu'
```
### Carthage
```
github "younatics/YNDropDownMenu"
```
## Usage
```swift
import YNDropDownMenu
```

Init view with frame`[CGRect]`, Views`[UIView]` and Titles`[String]`
```swift
let view = YNDropDownMenu(frame:frame, dropDownViews: dropDownViews, dropDownViewTitles: ["Apple", "Banana", "Kiwi", "Pear"])
self.addSubview(view)
```
done!

### Inherit YNDropDownView (If you need)
```swift
class DropDownView: YNDropDownView {
   // override method to call open & close
    override func dropDownViewOpened() {
        print("dropDownViewOpened")
    }
    
    override func dropDownViewClosed() {
        print("dropDownViewClosed")
    }

    // Hide Menu
    self.hideMenu()

    // Change Menu Title At Index
    self.changeMenu(title: "Changed", at: 1)
    self.changeMenu(title: "Changed", status: .selected, at: 1)

    // Change View At Index 
    self.changeView(view: UIView(), at: 3)

    // Always Selected Menu
    self.alwaysSelected(at: 0)
    self.normalSelected(at: 0)
}
```

### Customize

Show & Hide Menu 
```swift
view.showAndHideMenu(at:1)

// When view is already opened
view.hideMenu()
```

Disable & Enable Menu 
```swift
view.disabledMenu(at: 2)
view.enabledMenu(at: 3)
```

Always/Normal selected button label
```swift
view.alwaysSelected(at: 0)
view.normalSelected(at: 0)
```

Button Image with 3 situations (normal, selected, disabled)
```swift
view.setImageWhen(normal: UIImage(named: "arrow_nor"), selected: UIImage(named: "arrow_sel"), disabled: UIImage(named: "arrow_dim"))
```

Label color with 3 situations
```swift
view.setLabelColorWhen(normal: UIColor.black, selected: UIColor.blue, disabled: UIColor.gray)
```

Label font with 3 situations
```swift
view.setLabelFontWhen(normal: UIFont.systemFont(ofSize: 12), selected: UIFont.boldSystemFont(ofSize: 12), disabled: UIFont.systemFont(ofSize: 12))
```

BlurEffectView
```swift
// Enadbled or Disabled first (Default true)
view.backgroundBlurEnabled = false

// Use this line if you want to change UIBlurEffectStyle
view.blurEffectStyle = .light

// Or customize blurEffectView(UIView)
let backgroundView = UIView()
backgroundView.backgroundColor = UIColor.black
view.blurEffectView = backgroundView

// Animation end alpha
view.blurEffectViewAlpha = 0.7
```

Animation duration
```swift
view.showMenuDuration = 0.5
view.hideMenuDuration = 0.3
```

Animation velocity, damping
```swift
view.showMenuSpringVelocity = 0.5
view.showMenuSpringWithDamping = 0.8

view.hideMenuSpringVelocity = 0.9
view.hideMenuSpringWithDamping = 0.8
```

Change Menu Title At Index
```swift
view.changeMenu(title: "Changed", at: 1)
view.changeMenu(title: "Changed", status: .selected, at: 1)

```

Change View At Index 
```swift
view.changeView(view: UIView(), at: 3)
```

Change Bottom Line
```swift
view.bottomLine.backgroundColor = UIColor.black
view.bottomLine.isHidden = false
```


### Deprecated
```swift
extension YNDropDownMenu {
    @available(*, deprecated, message: "use init(frame: CGRect, dropDownViews: [UIView], dropDownViewTitles: [String]) instead")
    public init(frame: CGRect, YNDropDownViews: [YNDropDownView], dropDownViewTitles: [String])

    @available(*, deprecated, message: "use alwaysSelected(at index: Int) instead")
    open func alwaysSelectedAt(index: Int) {
        self.alwaysSelected(at: index)
    }
    
    @available(*, deprecated, message: "use disabledMenu(at index: Int) instead")
    open func disabledMenuAt(index: Int) {
        self.disabledMenu(at: index)
    }
    
    @available(*, deprecated, message: "use enabledMenu(at index: Int) instead")
    open func enabledMenuAt(index: Int) {
        self.enabledMenu(at: index)
    }

    @available(*, deprecated, message: "use showAndHideMenu(at index: Int) instead")
    open func showAndHideMenuAt(index: Int) {
        self.showAndHideMenu(at: index)
    }
}

extension YNDropDownView {
    @available(*, deprecated, message: "use changeMenu(title: String, at index: Int) instead")
    open func changeMenuTitleAt(index: Int, title: String) {
        self.delegate?.changeMenu(title: title, at: index)
    }
}
```
## References
#### Please tell me or make pull request if you use this library in your application :) 
#### [@zigbang](https://github.com/zigbang)
#### [MotionBook](https://github.com/younatics/MotionBook)

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## Thanks to
[jegumhon](https://github.com/jegumhon)

## License
YNDropDownMenu is available under the MIT license. See the LICENSE file for more info.
