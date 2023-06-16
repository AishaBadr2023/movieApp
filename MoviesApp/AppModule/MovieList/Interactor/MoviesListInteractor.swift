//
//  MoviesListInteractor.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import Foundation

class MoviesListInteractor: MoviesListViewDataCollecting {
    func getMoviesList(page: Int , completionClosure: @escaping (MoviesList?, NSError?) -> (Void)) {
        CoreNetwork.sharedInstance.requestMovieList(page: page , completionClosure: completionClosure)
    }
}
