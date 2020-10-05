# FlutterwaveSDK

<p align="center">
    <img title="Flutterwave" height="200" src="https://flutterwave.com/images/logo-colored.svg" width="50%"/>
</p>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

[Imgur](https://i.imgur.com/NTj6IpL.png)

## Requirements
Flutterwave SDK is compatible with iOS apps running on iOS 11.0 and above. It requires Xcode 10.0+ to build the source.


## Installation

FlutterwaveSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FlutterwaveSDK'
```

## Usage

```swift

import FlutterwaveSDK

class ViewController: UIViewController, FlutterwavePayProtocol {

func tranasctionSuccessful(flwRef: String?, responseData: FlutterwaveDataResponse?) {
print("Successful with \(responseData?.flwRef ?? "Failed to return data")")

}

func tranasctionFailed(flwRef: String?, responseData: FlutterwaveDataResponse?) {
print( "Failed transaction with FlwRef \(flwRef.orEmpty())")
}

let flutterLabel = UILabel()
let exampleLabel = UILabel()
let underLineView = UIView()
let launchButton = UIButton(type: .system)



@objc func showExample(){
    let config = FlutterwaveConfig.sharedConfig()
    config.paymentOptionsToExclude = []
    config.currencyCode = "NGN" // This is the specified currency to charge in.
    config.email = "user@flw.com" // This is the email address of the customer
    config.isStaging = false // Toggle this for staging and live environment
    config.phoneNumber = "077883***1" //Phone number
    config.transcationRef = "IOS TEXT" // This is a unique reference, unique to the particular transaction being carried out. It is generated when it is not provided by the merchant for every transaction.
    config.firstName = "Yemi" // This is the customers first name.
    config.lastName = "Desola" //This is the customers last name.
    config.meta = [["metaname":"sdk", "metavalue":"ios"]] //This is used to include additional payment information
    config.narration = "simplifying payments for endless possibilities"
    config.publicKey = "[PUB_KEY]" //Public key
    config.encryptionKey = "[ENCRYPTION_KEY]" //Encryption key
    config.isPreAuth = false  // This should be set to true for preauthoize card transactions
    let controller = FlutterwavePayViewController()
    let nav = UINavigationController(rootViewController: controller)
    controller.amount = "[]" // This is the amount to be charged.
    controller.delegate = self
    self.present(nav, animated: true)
}

```

## Author

Flutterwave Developers

## License

FlutterwaveSDK is available under the MIT license. See the LICENSE file for more info.
