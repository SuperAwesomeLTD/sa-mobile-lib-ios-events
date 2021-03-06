Pod::Spec.new do |s|
  s.name = 'SAEvents'
  s.version = '2.2.5'
  s.summary = 'Library that sends Events to AwesomeAds AdServer'
  s.description = <<-DESC
    Sends custom AA events as single bursts or from an array as well as Moat events
                       DESC
  s.homepage = 'https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-events'
  s.license = {
	:type => 'GNU LESSER GENERAL PUBLIC LICENSE Version 3',
	:file => 'LICENSE'
  }
  s.author = {
	'Gabriel Coman' => 'gabriel.coman@superawesome.tv'
  }
  s.source = {
	:git => 'https://github.com/SuperAwesomeLTD/sa-mobile-lib-ios-events.git',
	:branch => 'master',
	:tag => '2.2.5' }
  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.default_subspec = 'Core'
  s.dependency 'SAUtils', '1.5.6'
  s.dependency 'SANetworking', '1.0.1'
  s.dependency 'SAModelSpace', '1.0.1'
  s.dependency 'SASession', '1.1.3'
  s.subspec 'Core' do |c|
    c.source_files = 'Pod/Classes/**/*'
  end

  s.subspec 'Moat' do |mo|
    mo.frameworks = 'AdSupport', 'WebKit'
    mo.dependency 'SAEvents/Core'
    mo.source_files = 'Pod/Plugin/Moat/*'
    mo.vendored_libraries = 'Pod/Libraries/libSUPMoatMobileAppKit.a'
    # mo.vendored_frameworks = 'Pod/Libraries/SUPMoatMobileAppKit.framework'
  end

  s.subspec 'Moat2' do |mo2|
    mo2.frameworks = 'AdSupport', 'WebKit'
    mo2.dependency 'SAEvents/Core'
    mo2.source_files = 'Pod/Plugin/Moat2/*'
    # mo.vendored_libraries = 'Pod/Libraries/libSUPMoatMobileAppKit.a'
    mo2.vendored_frameworks = 'Pod/Libraries/SUPMoatMobileAppKit.framework'
  end
end
