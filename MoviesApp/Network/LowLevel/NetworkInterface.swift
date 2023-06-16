//
//  NetworkInterface.swift
//  MoviesApp
//
//  Created by soft xpert on 14/06/2023.
//

import Foundation
import Alamofire


typealias NetworkingCompletionBlock = (Data?, NSError?) -> (Void)
enum RequestMethod: String {
    case GET, POST, PUT, DELETE,PATCH
}

enum Encoding {
    case urlEncodedInURL
    case json
}

struct RequestSpecs {
    let method: RequestMethod
    let URLString: String
    let parameters: [String: AnyObject]?
    let headers: HTTPHeaders?
    let encoding: Encoding
    
    init(method: RequestMethod, URLString: String, parameters: [String: AnyObject]?, headers: HTTPHeaders? = nil, encoding: Encoding = .json) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
}

protocol NetworkingInterface {
    func request(_ specs: RequestSpecs, completionBlock: @escaping NetworkingCompletionBlock)
}
