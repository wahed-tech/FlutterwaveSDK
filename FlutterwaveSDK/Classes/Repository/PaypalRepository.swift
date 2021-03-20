//
//  PaypalRepository.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 19/03/2021.
//


import RxSwift

protocol PaypalRepository {

    func payPal(request:PaypalRequest) -> Observable<NetworkResult<PaypalResponse>>

}

class PaypalRepositoryImpl: BaseRepository, PaypalRepository {

    func payPal(request: PaypalRequest) -> Observable<NetworkResult<PaypalResponse>> {
        return makeNetworkPostRequestRx(endPoint: VersionThreeServicesApi.payPal, request: request, response: PaypalResponse.self, successCondition: { response in
            response.status == "success"
        }, errorMessage: {response in
            response.message ?? "Something went wrong"
        })
    }

}
