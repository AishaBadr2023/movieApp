//
//  MoviesListPresenter.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import Foundation
import Toast_Swift

class MovieListPresenter {
    weak var delegate:  MoviesListControllerInput?
    var interactor:  MoviesListViewDataCollecting?
    var router: MoviesListViewRouting?
    private var currentPage = 1
    init(delegate: MoviesListControllerInput, interactor: MoviesListViewDataCollecting,router:MoviesListViewRouting ) {
        self.delegate = delegate
        self.interactor = interactor
        self.router = router
    }
    fileprivate func getMoviesList(page: Int) {
        interactor?.getMoviesList(page: page) { (list, error) in
            if let movies = list {
                if movies.results.isEmpty {
                    self.delegate?.showEmptyScreen()
                } else {
                    self.delegate?.relaodTable(movieList: list)
                }
            } else {
                self.delegate?.showEmptyScreen()
                ToastHelper.showToast(message: "An Error Occured !", icon: "warning.png")
            }
            
        }
    }
}

extension MovieListPresenter: MoviesListViewControllerOutput {
    func didSelectMovie(movie: Movie?) {
        router?.showMoviesDetail(movie: movie)
    }
    
    func refreshData() {
        getMoviesList(page: 1)
    }
    
    func loadMoreData() {
        currentPage = currentPage + 1
        getMoviesList(page: currentPage)

    }
    
    func viewDidLoaded() {
        delegate?.configureTableView()
        getMoviesList(page: 1)
        
    }
}
