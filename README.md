
![image](https://user-images.githubusercontent.com/81238558/175767662-be4dc9ba-a6bd-459d-aaa3-f8ad0c96aa37.png)

# EkycID SDK for iOS

![](https://img.shields.io/badge/platform-ios-blue) ![](https://img.shields.io/github/v/tag/EKYCSolutions/ekyc-id-ios?label=version)


The EkycID iOS SDK lets you build a factastic OCR and Face Recognition experienced in your iOS app.

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


# Get Started
This Quick Start guide will get you up and performing OCR scanning as quickly as possible. All steps described in this guide are required for the integration.

This guide closely follows the BlinkID-Sample app in the Samples folder of this repository. We highly recommend you try to run the sample app. The sample app should compile and run on your device, and in the iOS Simulator.

The source code of the sample app can be used as the reference during the integration.

## SDK initial ntegration

EKYCMLSDKIOS is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EkycID'
```

## Referencing header file
In files in which you want to use scanning functionality place import directive.</br>
Swift

```ruby
import EkycID
```

## Initiating the scanning process
To initiate the scanning process, first decide where in your app you want to add scanning functionality. Usually, users of the scanning library have a button which, when tapped, starts the scanning process. Initialization code is then placed in touch handler for that button. Here we're listing the initialization code as it looks in a touch handler method.</br>
Swift:

```ruby
import UIKit
import EkycID
import CoreGraphics

class ViewController: UIViewController, DocumentScannerEventListener {
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
    
    var cameraView: DocumentScannerCameraView!
    
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



# Device Requirement
### iOS Version
Currently EkycID require iOS 10 or newer.

### Cemera
Camera video preview resolution also matters. In order to perform successful scans, camera preview resolution must be at least 720p. Note that camera preview resolution is not the same as video recording resolution.

## Contact
For any other questions, feel free to contact us at <a href="https://ekycsolutions.com/">ekycsolutions.com</a>.

## License

© 2022 EKYC Solutions Co, Ltd. All rights reserved.
