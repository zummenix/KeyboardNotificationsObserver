
Pod::Spec.new do |s|
  s.name             = 'KeyboardNotificationsObserver'
  s.version          = '0.2.0'
  s.summary          = 'An observer of `UIKeyboard` notifications.'

  s.description      = <<-DESC
An observer for `UIKeyboard` notifications that provides a safe and convenient interface.
                       DESC

  s.homepage         = 'https://github.com/zummenix/KeyboardNotificationsObserver'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aleksey Kuznetsov' => 'zummenix@gmail.com' }
  s.source           = { :git => 'https://github.com/zummenix/KeyboardNotificationsObserver.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'KeyboardNotificationsObserver/Classes/**/*'
  s.frameworks = 'UIKit'
end
