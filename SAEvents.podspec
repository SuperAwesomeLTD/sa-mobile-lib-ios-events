# Be sure to run `pod lib lint SAEvents.podspec' to ensure this is a

Pod::Spec.new do |s|
  s.name             = "SAEvents"
  s.version          = "1.8.9"
  s.summary          = "Library that sends Events to AwesomeAds AdServer"
  s.description      = <<-DESC
		       Sends custom AA events as single bursts or from an array as well as Moat events
                       DESC
  s.homepage         = "https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-events"
  s.license          = { :type => "GNU GENERAL PUBLIC LICENSE Version 3", :file => "LICENSE" }
  s.author           = { "Gabriel Coman" => "gabriel.coman@superawesome.tv" }
  s.source           = { :git => "https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-events.git", :tag => "1.8.9" }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.default_subspec = 'Core'
  s.dependency 'SAUtils', '1.5.2'
  s.dependency 'SANetworking', '0.2.9'
  s.dependency 'SAModelSpace', '0.4.9'
  s.dependency 'SASession', '0.3.6'
  s.subspec 'Core' do |c|
    c.source_files = 'Pod/Classes/**/*'
  end

  s.subspec 'Moat' do |mo|
    mo.frameworks = 'AdSupport', 'WebKit'
    mo.dependency 'SAEvents/Core'
    mo.source_files = 'Pod/Plugin/Moat/*', 'Pod/Libraries/Headers/*'
    # mo.preserve_paths = 'Pod/Plugin/Moat/*.*'
    # mo.vendored_libraries = 'Pod/Libraries/libSUPMoatMobileAppKit.a'

    mo.preserve_paths = 'Pod/Libraries/Headers/*.h'
    mo.vendored_libraries = 'Pod/Libraries/libSUPMoatMobileAppKit.a'
    mo.libraries = 'SUPMoatMobileAppKit'
    
  end
end
