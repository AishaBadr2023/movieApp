//
//  ImageConfigratorRequester.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import Foundation

class MoviesConfigurationRequester {
    
    private let configurationEndPoint = "https://api.themoviedb.org/3/configuration"
    fileprivate let networking: NetworkingInterface

    init(networking: NetworkingInterface) {
        self.networking = networking
    }

    func requestMovieConfiguration(completionHandler: @escaping (MovieConfiguration?,NSError?) -> ()) {
        let specs = RequestSpecs(method: .GET, URLString: configurationEndPoint, parameters: [ "api_key" : "c9856d0cb57c3f14bf75bdc6c063b8f3"] as? [String: AnyObject],encoding: .urlEncodedInURL)
        networking.request(specs) { (response, error) -> (Void) in
            guard let moviesData = response else {
                completionHandler(nil,error)
                return
            }
            completionHandler(self.parse(json: moviesData),nil)
        }
    }
    
    func parse(json: Data) -> MovieConfiguration? {
        let decoder = JSONDecoder()
        if let configs = try? decoder.decode(MovieConfiguration.self, from: json) {
          return configs
        }
        return nil
    }

    
}
