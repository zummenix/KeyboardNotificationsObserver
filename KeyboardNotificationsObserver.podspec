#
# Be sure to run `pod lib lint KeyboardNotificationsObserver.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KeyboardNotificationsObserver'
  s.version          = '0.1.0'
  s.summary          = 'An observer of `UIKeyboard` notifications.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An observer for `UIKeyboard` notifications that provides a safe and convenient interface.
                       DESC

  s.homepage         = 'https://github.com/zummenix/KeyboardNotificationsObserver'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zummenix' => 'zummenix@gmail.com' }
  s.source           = { :git => 'https://github.com/zummenix/KeyboardNotificationsObserver.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'KeyboardNotificationsObserver/Classes/**/*'
  s.frameworks = 'UIKit'
end
