//
//  MovieDetailWireFrame.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import UIKit

class MoviesDetailRouter {
    func navigateToMoviesDetailScreen(movie: Movie?) {
        
        guard let controller = MovieDetailViewController.instantiate() else { return }
        controller.movie = movie
        let rootNavigation = UINavigationController(rootViewController: controller)
        UIApplication.shared.topViewController()?.navigationController?.pushViewController(controller, animated: true)

    }
}
