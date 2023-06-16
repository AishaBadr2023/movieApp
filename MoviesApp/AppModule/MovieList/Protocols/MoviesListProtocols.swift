//
//  MoviesListProtocols.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import Foundation


protocol MoviesListControllerInput: class {
    func relaodTable(movieList: MoviesList?)
    func configureTableView()
    func showEmptyScreen()
}

protocol MoviesListViewControllerOutput {
    func viewDidLoaded()
    func refreshData()
    func loadMoreData()
    func didSelectMovie(movie: Movie?)
}

protocol MoviesListViewDataCollecting {
    func getMoviesList(page: Int ,completionClosure: @escaping (MoviesList?, NSError?) -> (Void))
}

protocol MoviesListViewRouting {
    func showMoviesDetail(movie: Movie? )
}
