//
//  CardViewModel.swift
// FlutterwaveSDK
//
//  Created by Rotimi Joshua on 15/09/2020.
//

import UIKit

import RxSwift
import Swinject

class CardViewModel: BaseViewModel{
    
    static let sharedViewModel: CardViewModel = Container.sharedContainer.resolve(CardViewModel.self)!
 
 
    let cardRepository: CardRepository
    let fetchCardResponse = PublishSubject<FetchSavedCardResponse>()
    let saveCardResponse = PublishSubject<SaveCardNewResponse>()
    let removeCardResponse = PublishSubject<RemoveCardResponse>()
    let sendCardOtpResponse = PublishSubject<SendCardOTPResponse>()
    
    var flwRef = ""
    
    init(cardRepository: CardRepository){
        self.cardRepository = cardRepository
    }
   
    func fetchCard() {
        let request = FetchSavedCardRequest(deviceKey: FlutterwaveConfig.sharedConfig().phoneNumber, publicKey: FlutterwaveConfig.sharedConfig().publicKey)
        makeAPICallRx(request: request, apiRequest: cardRepository.fetchCard(request:), successHandler: fetchCardResponse
    )}
  
    func saveCard(processorReference: String) {
        let request = SaveCardNewRequest(processorReference:processorReference, publicKey: FlutterwaveConfig.sharedConfig().publicKey, deviceEmail: FlutterwaveConfig.sharedConfig().email, device: UIDevice.current.identifierForVendor?.uuidString, deviceKey: FlutterwaveConfig.sharedConfig().phoneNumber)
        makeAPICallRx(request: request, apiRequest: cardRepository.saveCard(request:), successHandler: saveCardResponse
    )}
    
    func removeCard() {
        let request = RemoveCardRequest(mobileNumber: FlutterwaveConfig.sharedConfig().phoneNumber, publicKey: FlutterwaveConfig.sharedConfig().publicKey, cardHash: "")
        makeAPICallRx(request: request, apiRequest: cardRepository.removeCard(request:), successHandler: removeCardResponse
       )}
    
    
    func sendCardOtp() {
        let request = SendCardOTPRequest(cardHash:"", deviceKey:FlutterwaveConfig.sharedConfig().phoneNumber, publicKey: FlutterwaveConfig.sharedConfig().publicKey)
          makeAPICallRx(request: request, apiRequest: cardRepository.sendCardOtp(request:), successHandler: sendCardOtpResponse
         )}
    
}

