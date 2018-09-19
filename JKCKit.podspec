Pod::Spec.new do |s|
  s.name         = "JKCKit"
  s.version      = "0.0.3"
  s.summary      = "Utils for iOS Coding"
  s.description  = "..."
  s.homepage     = "https://github.com/JKCKit/JKCKit"
  s.license      = "MIT"
  s.author       = { "Kopus" => "421183082@qq.com" }
  s.source       = { :git => "https://github.com/JKCKit/JKCKit.git", :tag => "#{s.version}" }
  s.source_files  = "JKCKit/**/*.{h,m}"
  s.requires_arc = true
  s.frameworks = "Foundation","UIKit"
  s.ios.deployment_target = '8.0'

end
