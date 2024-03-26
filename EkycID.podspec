#
# Be sure to run `pod lib lint EKYCMLSDKIOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EkycID'
  s.version          = '2.0.8'
  s.summary          = 'An SDK to interact with EkycID services.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  An SDK to interact with EkycID services.
                       DESC

  s.homepage         = 'https://ekycsolutions.com'
  s.license     = { 
    :type => 'commercial',
    :text => <<-LICENSE
            © 2022 EKYC Solutions Co, Ltd. All rights reserved.
            LICENSE
    }
  s.author           = { 'Socret Lee' => 'ml-developer@ekycsolutions.com' }
  s.source           = { :git => 'https://github.com/EKYCSolutions/ekyc-id-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  if ENV['POD_DEVELOPMENT'] == '1'
    s.source_files = 'EkycID/Classes/**/**/**/*'
    s.static_framework = true
    s.resource_bundles = {
      'EkycID' => ['EkycID/Assets/*'],
    }
  else
    s.public_header_files = "EkycID.framework/Headers/*.h"
    s.source_files = "EkycID.framework/Headers/*.h"
    s.vendored_frameworks = "EkycID.framework"
    s.resource_bundles = {
      'EkycID' => ['EkycID/Assets/*'],
    }
  end


  s.dependency 'TensorFlowLiteSwift', '~> 2.12.0'
  s.dependency 'OpenCV', '4.3.0'
  s.dependency 'GoogleMLKit/FaceDetection', '2.5.0'
end
