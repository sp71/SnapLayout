#
# Be sure to run `pod lib lint SnapLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SnapLayout'
  s.version          = '0.1.2'
  s.summary          = 'Concise API for iOS Auto Layout'

s.description  = <<-DESC
# SnapLayout
Concise API for iOS Auto Layout. SnapLayout extends UIView to deliver a list of APIs to improve readability while 
also shortening constraint code. Internally using AutoLayout to provide the best experience. With SnapLayout, 
developers can pin, anchor, snap, or align views easily!
DESC

  s.homepage         = 'https://github.com/sp71/SnapLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Satinder Singh' => 'satindersingh71@gmail.com' }
  s.source           = { :git => 'https://github.com/sp71/SnapLayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'SnapLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SnapLayout' => ['SnapLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
