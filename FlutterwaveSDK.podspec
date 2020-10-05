#
# Be sure to run `pod lib lint FlutterwaveSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'FlutterwaveSDK'
    s.version          = '1.0.0'
    s.summary          = 'FlutterwaveSDK'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/Flutterwave/FlutterwaveSDK'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'rj' => 'rotimi.josua@flutterwavego.com' }
    s.source           = { :git => 'https://github.com/Flutterwave/FlutterwaveSDK.git', :tag => '1.0.0'}
    s.social_media_url = 'https://twitter.com/FlutterwaveEng'
    
    s.ios.deployment_target = '11.0'
    s.swift_versions = '5.0'
    
    s.source_files = 'FlutterwaveSDK/*/**.{h,m}'
#    s.ios.resource_bundle = { 'FlutterwaveSDK' => 'RaveSDK/Assets/{*.png,*.json}' }
    #s.resource = 'Resources/RaveSDK.bundle'
    

    
    
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.dependency 'lottie-ios','~>3.0.2'
    s.dependency 'Alamofire','5.2.1'
    s.dependency 'RxSwift', '~> 5'
    s.dependency 'RxCocoa', '~> 5'
    s.dependency 'SwinjectAutoregistration'
    s.dependency 'Swinject'
#    s.frameworks = 'MaterialComponents'
#    s.frameworks = 'MDFInternationalization'
    
end
