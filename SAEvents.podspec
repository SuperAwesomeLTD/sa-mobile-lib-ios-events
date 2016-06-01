# Be sure to run `pod lib lint SAEvents.podspec' to ensure this is a

Pod::Spec.new do |s|
  s.name             = "SAEvents"
  s.version          = "1.0.4"
  s.summary          = "Library that sends Events to AwesomeAds AdServer"
  s.description      = <<-DESC
		       Sends custom AA events as well as Moat events
                       DESC
  s.homepage         = "https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-events"
  s.license          = { :type => "GNU GENERAL PUBLIC LICENSE Version 3", :file => "LICENSE" }
  s.author           = { "Gabriel Coman" => "gabriel.coman@superawesome.tv" }
  s.source           = { :git => "https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-events.git", :tag => "1.0.4" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.resource_bundles = {
    'SAEvents' => ['Pod/Assets/*.png']
  }
  s.default_subspec = 'Core'
  s.dependency 'SAUtils'
  s.vendored_frameworks = "Pod/Frameworks/SUPMoatMobileAppKit.framework"

  s.subspec 'Core' do |c|
    c.source_files = 'Pod/Classes/**/*'
    c.resource_bundles = { 'SuperAwesome' => ['Pod/Assets/*'] }
  end

  s.subspec 'Moat' do |mo|
    mo.dependency 'SAEvents/Core'
    mo.source_files = "Pod/Plugin/Moat/*"
  end  
end
