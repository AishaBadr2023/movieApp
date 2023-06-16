//
//  CoreNetwork.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import Foundation

class CoreNetwork {
    static var sharedInstance = CoreNetwork()
    fileprivate lazy var networkCommunication: NetworkingInterface = {
        return AlamofireAdaptor()
    }()
    // MARK: Movie List
    func requestMovieList(page: Int , completionClosure: @escaping (MoviesList?, NSError?) -> (Void)) {
        let requester = MoviesListRequester(networking: networkCommunication)
        requester.requestMovieList(page: page, completionHandler: completionClosure)
    }
    
    // MARK: Movie Configuration
    
    func requestMovieConfiguration(completionClosure: @escaping (MovieConfiguration?, NSError?) -> (Void)) {
        let requester = MoviesConfigurationRequester(networking: networkCommunication)
        requester.requestMovieConfiguration(completionHandler: completionClosure)
    }
    
    
}
