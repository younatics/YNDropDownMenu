# Installation & Update

YNDropDownMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'YNDropDownMenu'`

## [v1.3.1](https://github.com/younatics/YNDropDownMenu/releases/tag/1.3.0)
* Add `changeMenuTitleAt(index: Int, title: String)` function in `YNDropDownView` and `YNDropDownMenu`

## [v1.3.0](https://github.com/younatics/YNDropDownMenu/releases/tag/1.3.0)
* Add override method `dropDownViewOpened` called when drop down view opened in `YNDropDownView`
* Add override method `dropDownViewClosed` called when drop down view closeed in `YNDropDownView`
* Init method `YNDropDownMenu(frame: frame, YNDropDownViews: [YNDropDownView], dropDownViewTitles: [String])` deprecated in `YNDropDownMenu`
* Add `alwaysSelectedAt(index: index)` function in `YNDropDownMenu`

## [v1.2.3](https://github.com/younatics/YNDropDownMenu/releases/tag/1.2.3)
* Add Image Folder

## [v1.2.2](https://github.com/younatics/YNDropDownMenu/releases/tag/1.2.2)
* Init style added UIView and YNDropDownView

## [v1.2.1](https://github.com/younatics/YNDropDownMenu/releases/tag/1.2.1)
* Customize UIFont

## [v1.2.0](https://github.com/younatics/YNDropDownMenu/releases/tag/1.2.0)
* Inherit YNDropDownView instead of UIView to add views for YNDropDownMenu
* Available to call hideMenu in YNDropDownView
* Support Carthage [#1](https://github.com/younatics/YNDropDownMenu/issues/1)

