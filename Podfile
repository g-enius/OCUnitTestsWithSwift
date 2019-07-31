# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'OCUnitTestsWithSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OCUnitTestsWithSwift
  pod 'Realm'
  pod 'Reachability' #SkyReachability is copied from this, needs to be migrated.
  
  #for swift only
  pod 'Alamofire'
  pod 'SwiftyJSON'
  
  #for RxSwift
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'RxDataSources'
  pod 'Moya/RxSwift', '~> 14.0.0-alpha.1'
  pod 'Action'

  target 'OCUnitTestsWithSwiftTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Realm/Headers'
    pod 'RxBlocking', '~> 5'
    pod 'RxTest', '~> 5'
    pod 'Nimble'
    pod 'RxNimble'
    pod 'OHHTTPStubs'
    pod 'OHHTTPStubs/Swift'
  end

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              # This works around a unit test issue introduced in Xcode 10.
              # We only apply it to the Debug configuration to avoid bloating the app size
              if config.name == "OCUnitTestsWithSwift" && defined?(target.product_type) && target.product_type == "com.apple.product-type.framework"
                  config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = "YES"
              end
          end
      end
  end
end
