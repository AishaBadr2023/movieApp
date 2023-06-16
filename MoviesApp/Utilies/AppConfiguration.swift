//
//  AppConfiguration.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import Foundation
class AppConfiguration {
    static var shared = AppConfiguration()
    
     var configuration: MovieConfiguration?
     var imageBaseUrl: String
    private init() {
        self.imageBaseUrl = ""
    }
    
    
    func requestConFiguration() {
        CoreNetwork.sharedInstance.requestMovieConfiguration() { [weak self] configurations, error in
            guard let weakSelf = self else { return }
            if let unwrappedError = error { print(unwrappedError.localizedDescription); return }
            guard let unwrappedSettings = configurations else { return }
            weakSelf.configuration = unwrappedSettings
            weakSelf.imageBaseUrl = (weakSelf.configuration?.images.base_url ?? "" ) + (weakSelf.configuration?.images.poster_sizes.first ?? "w500")
        }
    }
    
}
