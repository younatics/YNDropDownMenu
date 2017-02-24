# YNDropDownMenu

[![Version](https://img.shields.io/cocoapods/v/YNDropDownMenu.svg?style=flat)]
(http://cocoapods.org/pods/YNDropDownMenu)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/YNDropDownMenu/blob/master/LICENSE)
[![Platform]
(https://img.shields.io/cocoapods/p/YNDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/YNDropDownMenu)
![Language](https://img.shields.io/badge/language-Swift-brightgreen.svg?style=flat)

## Congratulation!
- Recorded 4th in Trending in open source 2017.02.24
- Recorded 7th in Trending developers 2017.02.24

- Recorded 7th in Trending in open source 2017.02.23
- Recorded 11th in Trending developers 2017.02.23

## Updates

See [CHANGELOG](https://github.com/younatics/YNDropDownMenu/blob/master/CHANGELOG.md) for details

## Intoduction
The eligible dropdown menu, written in Swift 3, appears dropdown menu to display a view of related items when a user click on the dropdown menu. You can customize dropdown view whatever you like (e.g. UITableView, UICollectionView... etc)


![demo](YNDropDownMenu.gif)
![demo2](YNDropDownMenu2.gif)
![demo3](YNDropDownMenu3.gif)

## Requirements

`YNDropDownMenu` written in Swift 3. Compatible with iOS 8.0+

## Installation

YNDropDownMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'YNDropDownMenu'`

## Usage

Import first 

`import YNDropDownMenu`


Init view with frame[CGRect], Views[YNDropDownView] and Titles[String]
```
let view = YNDropDownMenu(frame:frame, dropDownViews: dropDownViews, dropDownViewTitles: ["Apple", "Banana", "Kiwi", "Pear"])
self.addSubview(view)
```

Done!

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Customize

Show & Hide Menu 
```
view.showAndHideMenuAt(index:1)

// When view is already opened
view.hideMenu()
```

In your Custom YNDropDownView
```
self.hideMenu()
```

Disable & Enable Menu 
```
view.disabledMenuAt(index: 2)
view.enabledMenuAt(index: 3)
```

Button Image with 3 situations (normal, selected, disabled)
```
view.setImageWhen(normal: UIImage(named: "arrow_nor"), selected: UIImage(named: "arrow_sel"), disabled: UIImage(named: "arrow_dim"))
```

Label color with 3 situations
```
view.setLabelColorWhen(normal: UIColor.black, selected: UIColor.blue, disabled: UIColor.gray)
```

BlurEffectView
```
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
```
view.showMenuDuration = 0.5
view.hideMenuDuration = 0.3
```

Animation velocity, damping
```
view.showMenuSpringVelocity = 0.5
view.showMenuSpringWithDamping = 0.8

view.hideMenuSpringVelocity = 0.9
view.hideMenuSpringWithDamping = 0.8
```

## Author

[Younatics](http://younatics.github.io)

## License

YNDropDownMenu is available under the MIT license. See the LICENSE file for more info.
