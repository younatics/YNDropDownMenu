#
# Be sure to run `pod lib lint YNDropDownMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YNDropDownMenu'
  s.version          = '3.0.2'
  s.summary          = 'Awesome Dropdown menu for iOS with Swift 4'

  s.description      = <<-DESC
                        Awesome dropdown menu, written in Swift 4, appears dropdown menu to display a view of related items when a user click on the dropdown menu. You can customize dropdown view whatever you like (e.g. UITableView, UICollectionView... etc)
                        DESC

  s.homepage         = 'https://github.com/younatics/YNDropDownMenu'
  s.screenshots      = 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu.gif', 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu2.gif', 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu3.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Seungyoun Yi" => "younatics@gmail.com" }

  s.source           = { :git => 'https://github.com/younatics/YNDropDownMenu.git', :tag => s.version.to_s }
  s.source_files     = 'YNDropDownMenu/*.swift'
  s.social_media_url = 'https://twitter.com/younatics'

  s.ios.deployment_target = '8.0'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
