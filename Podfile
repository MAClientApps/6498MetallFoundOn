# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Metal Found On' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MetalDetector
  pod 'Google-Mobile-Ads-SDK'
  pod 'Firebase'
  pod 'Firebase/Core'
  pod 'Firebase/RemoteConfig'
  pod 'FirebaseCrashlytics'
  pod 'SwiftyStoreKit'
  pod 'MobFlowiOS', :git => 'https://github.com/MASDKManager/MobFlowSwift.git', :tag => '3.0.4'

  post_install do |installer|
        installer.generated_projects.each do |project|
              project.targets.each do |target|
                  target.build_configurations.each do |config|
                      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
                   end
              end
       end
    end
  
end
