# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Checkers' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Checkers
  pod 'IQKeyboardManagerSwift'
  pod 'LTMorphingLabel'
  pod "GlitchLabel"
  pod 'SwiftEntryKit'
  pod 'Firebase/Core'
  pod 'Firebase/RemoteConfig'
  pod 'Google-Mobile-Ads-SDK'
  pod 'NVActivityIndicatorView'

  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end

end
