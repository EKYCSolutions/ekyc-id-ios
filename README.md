
![image](https://user-images.githubusercontent.com/81238558/175767662-be4dc9ba-a6bd-459d-aaa3-f8ad0c96aa37.png)

<h1>EkycID SDK for Android</h1><br>

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/EKYCSolutions/ekyc-id-android)


The EkycID Android SDK lets you build a factastic OCR and Face Recognition experienced in your Android app.

With one quick scan, your users will be able to extract information from thier identity cards, passports, driver licenses, license plate, vehicle registration, covid-19 vaccinate card, and any other document by government-issued.


EkycID is:
* Easy to integrate into existing ecosystems and solutions through the use of SDKs that supported both native and hybrid applications.
* Better for user experience being that the document detections and liveness checks are done directly offline on the device.
* Great for cutting down operations cost and increasing efficiency by decreasing reliance on human labor and time needed for manual data entry. 


EkycID can:
* Extract information from identity documents through document recognition & OCR.
* Verify whether an individual is real or fake through liveness detection, and face recognition. 
* Verify the authenticity of the identity documents by combining the power of document detection, OCR, liveness detection, and face recognition. 


To see all of these features at work download our free demo app at PlayStore. For iOS device is recently in review from apple, you can try it on TestFlight instead:

<a href="https://apps.apple.com/us/app/testflight/id899247664?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1406073600&h=56f9327554e3f4a3efa25cd1a21dcc2f" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>
<br></br>

<h1>Quick Start</h1>
This Quick Start guide will get you up and performing OCR scanning as quickly as possible. All steps described in this guide are required for the integration.

This guide closely follows the BlinkID-Sample app in the Samples folder of this repository. We highly recommend you try to run the sample app. The sample app should compile and run on your device, and in the iOS Simulator.

The source code of the sample app can be used as the reference during the integration.

<h2>SDK initial ntegration</h2>

EKYCMLSDKIOS is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EkycID'
```

<h4>Manual integration</h4>
<p><a href="https://github.com/EKYCSolutions/ekyc-id-ios">Download</a> latest release (Download .zip or .tar.gz file starting with BlinkID. DO NOT download Source Code as GitHub does not fully support Git LFS)</p>
<h6>OR</h6>
<p>Clone this git repository:</p>
<li>To clone, run the following shell command:

 ```ruby
  git clone https://github.com/EKYCSolutions/ekyc-id-ios.git
 ```
 
</li>
<li>Copy <code>EkycID.framework</code> to your project folder.</li>
<li>In your Xcode project, open the Project navigator. Drag the EkycID.framework file to your project, ideally in the Frameworks group, together with other frameworks you're using. When asked, choose "Create groups", instead of the "Create folder references" option.</li>
<li>Since EkycID.framework is a dynamic framework, you also need to add it to embedded binaries section in General settings of your target and choose option <code>Embed & Sign</code>.</li>
<li><p dir="auto">Include the additional frameworks and libraries into your project in the "Linked frameworks and libraries" section of your target settings.</p>
  <ul dir="auto">
    <li>libc++.tbd</li>
    <li>libiconv.tbd</li>
    <li>libz.tbd</li>
  </ul>
</li>

<h2>Referencing header file</h2>
In files in which you want to use scanning functionality place import directive.</br>
Swift

```ruby
import EkycID
```

<h2>Initiating the scanning process</h2>
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



<h1>Device Requirement</h1>
<h3 dir="auto">iOS Version</h3>
<p>Currently EkycID require iOS 12 or newer. For best performance and compatibility, we recommend at least Iphone 6.</p>

<h3 dir="auto">Cemera</h3>
<p>Camera video preview resolution also matters. In order to perform successful scans, camera preview resolution must be at least 720p. Note that camera preview resolution is not the same as video recording resolution.</p>

<h2>Contact</h2>
<p>For any other questions, feel free to contact us at 
  <a href="https://ekycsolutions.com/">ekycsolutions.com</a>
</p>


