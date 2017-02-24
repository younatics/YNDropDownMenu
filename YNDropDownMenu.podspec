#
# Be sure to run `pod lib lint YNDropDownMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YNDropDownMenu'
  s.version          = '1.2.0'
  s.summary          = 'YNDropDownMenu is created to make drop down menu with Swift3'

  s.description      = <<-DESC
TODO: You can init with frame. Button Images, Labels are all optional. See example and README.md in my github
                       DESC

  s.homepage         = 'https://github.com/younatics/YNDropDownMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'younatics@gmail.com'
  s.source           = { :git => 'https://github.com/younatics/YNDropDownMenu.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'YNDropDownMenu/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
