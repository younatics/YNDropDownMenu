#
# Be sure to run `pod lib lint YNDropDownMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YNDropDownMenu'
  s.version          = '1.3.0'
  s.summary          = 'YNDropDownMenu is created to make drop down menu with Swift 3'

  s.description      = 'The eligible dropdown menu, written in Swift 3, appears dropdown menu to display a view of related items when a user click on the dropdown menu. You can customize dropdown view whatever you like (e.g. UITableView, UICollectionView... etc)'

  s.homepage         = 'https://github.com/younatics/YNDropDownMenu'
  s.screenshots     = 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu.gif', 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu2.gif', 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu3.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'younatics@gmail.com'
  s.source           = { :git => 'https://github.com/younatics/YNDropDownMenu.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'YNDropDownMenu/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
