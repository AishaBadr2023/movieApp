//
//  MoviesListRouter.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import UIKit

class MoviesListRouter: MoviesListViewRouting {
    func showMoviesDetail(movie: Movie?) {
        MoviesDetailRouter().navigateToMoviesDetailScreen(movie: movie)
    }
    
    func navigateToMoviesListScreen() {
        guard let controller = MoviesListViewController.instantiate() else { return }
        let rootNavigation = UINavigationController(rootViewController: controller)
        controller.presenter = MovieListPresenter(delegate: controller, interactor: MoviesListInteractor(), router: self)
        UIApplication.shared.replaceRoot(rootNavigation: rootNavigation)

    }
}
