//
//  FlutterwaveSafariViewController.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 20/03/2021.
//


import UIKit
import SafariServices
import RxSwift


class FlutterwaveSafariViewController: SFSafariViewController {
   
    var url:String?
    var flwRef:String?
    var progressView: UIProgressView!
    let diposableBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setUpObservers()
    }
    
    func setUpObservers(){
        PaymentServicesViewModel.sharedViewModel.mpesaVerifyResponse.observeOn(MainScheduler.instance).subscribe(onNext: {response in
            if(response.getStatus() != PaymentState.PENDING){
//                self.delegate?.tranasctionSuccessful(flwRef: response.data?.flwRef ?? "", responseData: response.data?.toFlutterResponse())
    
                self.dismiss(animated: true, completion: nil)
            }
            
        } ).disposed(by: diposableBag)
        
        PaymentServicesViewModel.sharedViewModel.error.observeOn(MainScheduler.instance).subscribe(onNext: { error in
            self.progressView.removeFromSuperview()
            showSnackBarWithMessage(msg: error )
            
        } ).disposed(by: diposableBag)
    }
    
    override func loadView() {
       
    }
    
    
    
    func showSafari(url: String?,ref:String?) {
        
        print("Hello i got here")
        
        if let url = URL(string: url.orEmpty()) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
           
            let vc = SFSafariViewController(url: url, configuration: config)
            
            present(vc, animated: true)
            
            print("I got here 2")
        }
    }
    
    
    
    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        if URL.absoluteString == "WHATEVER YOUR LINK IS"{
            controller.dismiss(animated: true, completion: nil)
        }
        let finalURL = URL.absoluteString
        print(finalURL)
        if (finalURL.contains("/complete") ||
                finalURL.contains("submitting_mock_form")){
            print("success page")
            PaymentServicesViewModel.sharedViewModel.mpesaVerify(flwRef: flwRef.orEmpty())
            
        }else if(finalURL.contains("/finish")){
            let newURL = finalURL
            if let range = newURL.range(of: "https://webhook.site/finish") {
                let dataPayload = newURL[range.upperBound...]
                print("Extra Data \(dataPayload)")
            }
            let data = URL.queryParameters
            let response = data?["resp"] as? String
            
            do{
                let products = try JSONDecoder().decode(MobileMoneyUrlResponse.self, from: response?.data(using: .utf8) ?? Data())
                
                PaymentServicesViewModel.sharedViewModel.mpesaVerify(flwRef: products.data.flwRef ?? "")
      
            } catch(let error) {
                print("\(error.localizedDescription)")
            }
            //            print("Extra PayData \(products)")
            
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        
        dismiss(animated: true)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}





