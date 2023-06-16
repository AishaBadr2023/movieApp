//
//  NetworkAdaptor.swift
//  MoviesApp
//
//  Created by AishaBadr 14/06/2023.
//

import Foundation
import Alamofire

class AlamofireAdaptor: NetworkingInterface {
    let minValidStatusCode = 200
    let maxValidStatusCode = 300
    let AlamofireBugErrorCode = 3840
    let validContentTypes = ["application/json", "Accept", "application/hal+json", "image/jpeg", "image/png", "image/jpg"]
    
    init() {
    }
    
    func request(_ specs: RequestSpecs, completionBlock: @escaping NetworkingCompletionBlock) {
        if !NetworkObserver.sharedInstance.checkConnection() { return }
        let encoding = NetworkHelper.convertRequestEnconding(specs.encoding)
        _ = AF.request(specs.URLString, method: NetworkHelper.convertRequestMethodToAlamofireMethod(specs.method), parameters: specs.parameters, encoding: encoding, headers: specs.headers )
            .validate(statusCode: minValidStatusCode..<maxValidStatusCode)
            .validate(contentType: self.validContentTypes).response
        { response in
                if let requestURL = response.request?.url?.absoluteString {
                    print("Request - \(requestURL)")
                }
            let error = response.error
                if error?._code == self.AlamofireBugErrorCode { completionBlock(response.data , nil); return }
                completionBlock(response.data, (error as NSError?))
            }

    }
    

    

}
