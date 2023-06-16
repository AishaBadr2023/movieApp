//
//  NetworkHelper.swift
//  MoviesApp
//
//  Created by Aisha Badr on 14/06/2023.
//

import Foundation
import Alamofire

class NetworkHelper {
   class func convertRequestEnconding(_ enconding: Encoding) -> ParameterEncoding {
        switch enconding {
        case .json:
            return JSONEncoding.default
        case.urlEncodedInURL:
            return URLEncoding.default
        }
    }
    
   class func convertRequestMethodToAlamofireMethod(_ method: RequestMethod) -> Alamofire.HTTPMethod {
        switch method {
        case .DELETE :
            return HTTPMethod.delete
        case .GET :
            return HTTPMethod.get
        case .PUT :
            return HTTPMethod.put
        case .POST :
            return HTTPMethod.post
        case .PATCH:
            return HTTPMethod.patch
        }
    }
}
