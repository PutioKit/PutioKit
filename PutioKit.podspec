Pod::Spec.new do |s|
  s.name         = "PutioKit"
  s.version      = "0.1"
  s.summary      = "Simple framework to use Put.io API in your iOS applications, written in Objective-C."
  # s.description  = <<-DESC
  #                   An optional longer description of PutioKit
  #
  #                   * Markdonw format.
  #                   * Don't worry about the indent, we strip it!
  #                  DESC
  s.homepage     = "http://putiokit.github.com/PutioKit/"

  s.license = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  
  s.authors      = { "Orta Therox" => "orta.therox@gmail.com", "other author" => "and email address" }
  s.source       = { :git => "https://github.com/PutioKit/PutioKit.git", :commit => "HEAD" }
  s.platform     = :ios, '5.0'
  s.frameworks = 'UIKit'
  s.requires_arc = true
  s.source_files = 'PutioKit/**/*.{h,m}'
  s.dependency 'AFNetworking', '~> 1.0'
end
