#
# Be sure to run `pod lib lint UpdateiOSApp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UpdateiOSApp'
  s.version          = '0.1.0'
  s.summary          = 'UpdateiOSApp for updateing the apps that are not in appstore.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'UpdateiOSApp for updateing the apps that are not in appstore for our apps .'


  s.homepage         = 'https://github.com/nesjboor/UpdateiOSApp'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nesjboor' => 'nesreenjboor@gmail.com' }
  s.source           = { :git => 'https://github.com/nesjboor/UpdateiOSApp.git', :tag => "0.1.0" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'UpdateiOSApp/Classes/**/*'

# s.resource_bundles = { 'UpdateiOSApp' => ['UpdateiOSApp/Assets/*.{png,jpeg,jpg}']}
s.resource_bundles = { 'UpdateiOSApp' => ['UpdateiOSApp/Assets/*'] }
s.resource = 'UpdateiOSApp/Assets/*.{storyboard,png}'

   s.public_header_files = 'UpdateiOSApp/Classes/**/*.h'
    s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
