#
# Be sure to run `pod lib lint EasyBeta.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyBeta'
  s.version          = '0.2.0'
  s.summary          = 'A short description of EasyBeta.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/OctMon/EasyBeta'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'OctMon' => 'octmon@qq.com' }
  s.source           = { :git => 'https://github.com/OctMon/EasyBeta.git', :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'EasyBeta/Classes/*'
  
  s.dependency 'Easy/Session', '~> 2.9.0' # https://github.com/OctMon/Easy
  s.dependency 'FLEX', '~> 4.6.1' # https://github.com/Flipboard/FLEX
  s.dependency 'GDPerformanceView-Swift', '~> 2.1.1' #https://github.com/dani-gavrilov/GDPerformanceView-Swift
  s.dependency 'OOMDetector', '~> 1.3' # https://github.com/Tencent/OOMDetector
  s.xcconfig = { 'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => '$(inherited) BETA' }
end
