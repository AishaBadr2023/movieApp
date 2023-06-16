//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import UIKit
import SwiftyStarRatingView

class MovieDetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    @IBOutlet weak var ratingView: SwiftyStarRatingView!
    // MARK: - Variables
     var movie: Movie?

    // MARK: - Initialization and Override

    static func instantiate() -> MovieDetailViewController? {
        let storyboard = UIStoryboard(name: MoviesListConstant.detailIdentifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: MoviesListConstant.detailIdentifier) as? MovieDetailViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        dateLabel.text = movie?.release_date
        titleLabel.text = movie?.title
        movieOverviewLabel.text = movie?.overview
        ratingView.value = CGFloat(movie?.vote_average ?? 0 )
        if let url = URL(string:(AppConfiguration.shared.imageBaseUrl) + (movie?.poster_path ?? "") ) {
            movieImage.downloadImageWithProgress(url)
        }
    }
}
