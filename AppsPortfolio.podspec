Pod::Spec.new do |s|
  s.name         = "AppsPortfolio"
  s.version      = "1.0.5"
  s.summary      = "To showcase multiple apps of a developer for cross promotion"
  s.description  = <<-DESC
      To showcase multiple apps of a developer for cross promotion using Swift. Its an offline way to show user about other apps and it's also possible to know which app users are having more interest.
                   DESC

  s.homepage     = "https://github.com/mahmudahsan/AppsPortfolio"
  s.screenshots  = "https://github.com/mahmudahsan/AppsPortfolio/raw/master/preview.gif", "https://github.com/mahmudahsan/AppsPortfolio/raw/master/plist_file.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Mahmud Ahsan" => "mahmud@thinkdiff.net" }
  s.social_media_url   = "http://twitter.com/mahmudahsan"
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/mahmudahsan/AppsPortfolio.git", :tag => s.version.to_s }
  s.source_files = "AppsPortfolio/AppsPortfolio/Sources/**/*"
  s.frameworks   = "Foundation"
end
