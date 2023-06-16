//
//  MovieListTableViewCell.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var adultIconImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func configureCell(movie: Movie?) {
        dateLabel.text = movie?.release_date
        titleLabel.text = movie?.title
        adultIconImage.isHidden = !(movie?.adult ?? true)
        if let url = URL(string:(AppConfiguration.shared.imageBaseUrl) + (movie?.poster_path ?? "") ) {
            movieImage.downloadImageWithProgress(url)
        }
        
    }
}
