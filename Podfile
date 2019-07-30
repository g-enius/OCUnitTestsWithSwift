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

end
