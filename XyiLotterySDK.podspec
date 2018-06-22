#
#  Be sure to run `pod spec lint XyiLotterySDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "XyiLotterySDK"
s.version      = "1.1.3"
s.summary      = "XyiLotterySDK is Lottery SDK , you can buy lottery in the SDK"

s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/CommonCrypto" }

s.homepage     = "https://github.com/GitForTSir/XyiLotterySDK.git"

s.license      = "MIT"
# s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

s.author             = { "TSir" => "3176525969@qq.com" }
# Or just: s.author    = "tangxianping"
# s.authors            = { "tangxianping" => "951180127@qq.com" }
s.social_media_url   = "https://github.com/GitForTSir/XyiLotterySDK.git"

# s.platform     = :ios
s.platform     = :ios, "9.0"
s.public_header_files = 'XyiLotterySDKDemo/XyiLotterySDK.framework/Headers/*.{h}'

#  When using multiple platforms
s.ios.deployment_target = "9.0"
# s.osx.deployment_target = "10.7"
# s.watchos.deployment_target = "2.0"
# s.tvos.deployment_target = "9.0"

s.source       = { :git => "https://github.com/GitForTSir/XyiLotterySDK.git", :tag => "#{s.version}" }
s.source_files    = 'XyiLotterySDKDemo/XyiLotterySDK.framework/Headers/*.{h}'
s.vendored_frameworks = 'XyiLotterySDKDemo/XyiLotterySDK.framework'



# s.public_header_files = "Classes/**/*.h"

s.frameworks = "Foundation","UIKit"

s.xcconfig = { "OTHER_LDFLAGS" => "-all_load -licucore" }

s.requires_arc = true

#s.dependency = ‘SSZipArchive’

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
# s.dependency "JSONKit", "~> 1.4"


end
