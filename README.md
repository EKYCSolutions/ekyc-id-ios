
![ekyc-logo](https://user-images.githubusercontent.com/81238558/175898415-4c0f508f-c2d5-4b3d-afba-f531551520d6.png)

# EkycID SDK for iOS

![](https://img.shields.io/badge/platform-ios-blue) ![](https://img.shields.io/github/v/tag/EKYCSolutions/ekyc-id-ios?label=version)


The EkycID iOS SDK lets you build a fantastic OCR and Face Recognition experienced in your iOS app.

With one quick scan, your users will be able to extract information from thier identity cards, passports, driver licenses, license plate, vehicle registration, covid-19 vaccinate card, and any other document by government-issued.


EkycID is:
* Easy to integrate into existing ecosystems and solutions through the use of SDKs that supported both native and hybrid applications.
* Better for user experience being that the document detections and liveness checks are done directly offline on the device.
* Great for cutting down operations cost and increasing efficiency by decreasing reliance on human labor and time needed for manual data entry. 


EkycID can:
* Extract information from identity documents through document recognition & OCR.
* Verify whether an individual is real or fake through liveness detection, and face recognition. 
* Verify the authenticity of the identity documents by combining the power of document detection, OCR, liveness detection, and face recognition. 


To see all of these features at work download our free demo app at PlayStore. For iOS device is recently in review from apple, you can try it on TestFlight by contact our developers.

# 1. Requirements

- Minimum iOS Deployment Target: 10.0
- Xcode 13 or newer
- Swift 5
- EkycID only supports 64-bit architectures (x86_64 and arm64).

# 2. Installation

**Step 1:** Add the following to your Info.plist.
```xml
<!-- Camera Access -->
<key>NSCameraUsageDescription</key>
<string>Camera Access for Scanning</string>
```

**Step 2:** Go to Project > Runner > Building Settings > Excluded Architectures > Any SDK > armv7

![](doc/build_settings_01.png)

**Step 3:** Make adjustments to your Podfile as shown below.

```ruby
# add this line:
$iOSVersion = '10.0'

post_install do |installer|
  # add these lines:
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=*]"] = "armv7"
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = $iOSVersion
  end
  
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    
    # add these lines:
    target.build_configurations.each do |config|
      if Gem::Version.new($iOSVersion) > Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'])
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = $iOSVersion
      end
    end
    
  end
end
```

**Step 4:** Add the following line to your Podfile. Then run `pod install.`

```ruby
pod 'EkycID'
```

# 3. Usage

## 3.1. Document Scanner

```swift
class ViewController: UIViewController, DocumentScannerEventListener {
    var cameraView: DocumentScannerCameraView!

    func onInitialize() {
        print("onInitialize")
    }

    func onDetection(detection: DocumentScannerResult) {
        print("onDetection")
        let image = UIImageView(image: detection.faceImage!)
        self.view.addSubview(image)
    }

    func onFrame(frameStatus: FrameStatus) {
        if (frameStatus != .PROCESSING) {
            print("\(frameStatus)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.cameraView = DocumentScannerCameraView(
            frame: self.view.frame,
            options: DocumentScannerOptions(preparingDuration: 1)
        )
        self.cameraView!.setWhiteList(whiteList: ["NATIONAL_ID"])
        self.cameraView.addListener(self)
        
        self.view.addSubview(self.cameraView)
        
        self.cameraView.start()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        self.cameraView.stop()
    }
}
```

## 3.2. Liveness Detection

```swift
class ViewController: UIViewController, LivenessDetectionEventListener {

    func onCountDownChanged(current: Int, max: Int) {
        print("current: \(current), max: \(max)")
    }

    func onFocus() {
        print("onFocus fish")
    }

    func onFocusDropped() {
        print("onFocusDropped")
    }

    func onPromptCompleted(completedPromptIndex: Int, success: Bool, progress: Float) {
        print("onPromptCompleted: \(completedPromptIndex), \(success), \(progress)")
        self.cameraView.nextImage()
    }

    func onAllPromptsCompleted(detection: LivenessDetectionResult) {
        print("onAllPromptsCompleted")
    }


    func onInitialize() {
        print("onInitialize")
    }

    func onFrame(frameStatus: FrameStatus) {
        if frameStatus != .PROCESSING {
            print("\(frameStatus)")
        }
    }
    
    var cameraView: LivenessDetectionCameraView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.cameraView = LivenessDetectionCameraView(
            frame: self.view.frame,
            options: LivenessDetectionOptions(prompts: [LivenessPromptType.BLINKING, LivenessPromptType.LOOK_RIGHT], promptTimerCountDownSec: 5)
        )
        self.cameraView.addListener(self)
        
        self.view.addSubview(self.cameraView)
        
        self.cameraView.start()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        self.cameraView.stop()
    }
}

```

## 3.3. Perform Face Compare and OCR

To perform face compare and ocr, you can call your server that integrated with our [NodeSDK]() to get face compare score and ocr response respectively.

# 4. Contact
<p>For any other questions, feel free to contact us at 
  <a href="https://ekycsolutions.com/">ekycsolutions.com</a>
</p>

# 5. License
© 2022 EKYC Solutions Co, Ltd. All rights reserved.
