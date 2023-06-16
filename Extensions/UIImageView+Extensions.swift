//
//  UIImageView+Extensions.swift
//  MoviesApp
//
//  Created by soft xpert on 16/06/2023.
//

import SDWebImage

extension UIImageView {
    func downloadImageWithProgress(_ url: URL, placeholderImage: UIImage? = nil) {
        sd_setImage(with: url, placeholderImage: placeholderImage ?? image) {
            [weak self]  (image, error, cacheType, imageURL) in
            guard self != nil , let _ = image else { return }
            self?.image = image
        }
    
    }
}
