Pod::Spec.new do |s|
  s.name         = "PutioKit"
  s.version      = "0.1"
  s.summary      = "Simple framework to use Put.io API in your iOS applications, written in Objective-C."
  s.homepage     = "http://putiokit.github.com/PutioKit/"

  s.license = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  
  s.authors      = { "Orta Therox" => "orta.therox@gmail.com", "other author" => "and email address" }
  s.source       = { :git => "https://github.com/PutioKit/PutioKit.git", :branch => "orta", :commit => "HEAD" }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.8'
  s.ios.frameworks  = 'UIKit'
  s.osx.framework   = 'CoreServices'
  s.requires_arc = true
  s.ios.source_files = 'PutioKit/**/*.{h,m}'
  s.osx.source_files = 'PutioKit/Categories', 'PutioKit/Models', 'PutioKit/PutIOClient.{h,m}',
    'PutioKit/PutIONetworkConstants.{h,m}', 'PutioKit/V2PutIOAPIClient.{h,m}', 
    'PutioKit/PutioKit.h'
  s.dependency 'AFNetworking', '~> 1.0'
end
