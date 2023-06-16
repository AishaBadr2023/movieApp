//
//  MoviesListRequester.swift
//  MoviesApp
//
//  Created by soft xpert on 14/06/2023.
//

import Foundation

class MoviesListRequester {
    
    private let movieEndPoint = "https://api.themoviedb.org/3/discover/movie"
    fileprivate let networking: NetworkingInterface

    init(networking: NetworkingInterface) {
        self.networking = networking
    }

    func requestMovieList(page: Int,completionHandler: @escaping (MoviesList?,NSError?) -> ()) {
        let specs = RequestSpecs(method: .GET, URLString: movieEndPoint, parameters: ["page" :page , "api_key" : "c9856d0cb57c3f14bf75bdc6c063b8f3"] as? [String: AnyObject],encoding: .urlEncodedInURL)
        networking.request(specs) { (response, error) -> (Void) in
            guard let moviesData = response else {
                completionHandler(nil,error)
                return
            }
            completionHandler(self.parse(json: moviesData),nil)
        } 
    }
    
    func parse(json: Data) -> MoviesList? {
        let decoder = JSONDecoder()
        if let movies = try? decoder.decode(MoviesList.self, from: json) {
          return movies
        }
        return nil
    }

    
}
