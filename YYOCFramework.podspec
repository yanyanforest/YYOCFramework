#
# Be sure to run `pod lib lint YYOCFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYOCFramework'
  s.version          = '0.1.0'
  s.summary          = '这是自己用的类库，基本上都是基类和一些通用的类'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
这是自己用的类库，基本上都是基类和一些通用的类。
                       DESC

  s.homepage         = 'https://github.com/yanyanforest/YYOCFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanyanforest' => 'yanyanforest@163.com' }
  s.source           = { :git => 'https://github.com/yanyanforest/YYOCFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'
  s.public_header_files = 'YYOCFramework/Classes/YYOCFramework.h'

#s.source_files = 'YYOCFramework/Classes/**/*.{h,m}','YYOCFramework/Classes/**/**/*.{h,m}','YYOCFramework/Classes/**/**/**/*.{h,m}'
    s.source_files = 'YYOCFramework/Classes/**/*'
# s.resource_bundles = {
  #   'YYOCFramework' => ['YYOCFramework/Assets/*.png']
  # }
    s.requires_arc = true
  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'Foundation'
    s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'Masonry', '~> 1.0.0'
    s.dependency 'Reachability'#网络状态
    s.dependency 'SDWebImage'#URL 图片
 #s.subspec 'FrameworkCYDA' do |ss|
 #ss.source_files = 'YYOCFramework/*Date*.{h,m}'
 #end
 #s.subspec 'Framework_CYUI' do |ss|
 #ss.source_files = 'YYOCFramework/*Date*.{h,m}'
 #end
end
