Pod::Spec.new do |s|
  s.name             = 'EkycID'
  s.version          = '1.0.15'
  s.summary          = 'An SDK to interact with EkycID services.'
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

  s.ios.deployment_target = '10.0'

  s.public_header_files = "EkycID.framework/Headers/*.h"
  s.source_files = "EkycID.framework/Headers/*.h"
  s.vendored_frameworks = "EkycID.framework"
  s.resource_bundles = {
    'EkycID' => ['EkycID/Assets/*']
  }


  s.dependency 'TensorFlowLiteSwift', '0.0.1-nightly.20211127'
  s.dependency 'OpenCV', '4.3.0'
  s.dependency 'GoogleMLKit/FaceDetection', '2.5.0'
  s.dependency 'MultipartForm', '0.1.0'
end
