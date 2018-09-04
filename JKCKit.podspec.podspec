Pod::Spec.new do |s|
  s.name         = "JKCKit.podspec"
  s.version      = "0.0.1"
  s.summary      = "Utils for iOS Coding"
  s.description  = <<-DESC
                   DESC
  s.homepage     = "https://github.com/JKCKit/JKCKit/blob/master/JKCKit.podspec"
  s.license      = "MIT"
  s.author             = { "Kopus" => "421183082@qq.com" }
  s.source       = { :git => "https://github.com/JKCKit/JKCKit/blob/master/JKCKit.podspec.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
