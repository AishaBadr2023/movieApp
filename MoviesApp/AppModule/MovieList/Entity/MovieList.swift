//
//  MovieList.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import Foundation

struct MoviesList: Codable {
    var page: Int
    var total_pages: Int
    var results: [Movie]
    var isLoadMore: Bool {
        get {
            return page < total_pages
        }
    }
}

struct Movie: Codable {
    var title: String
    var overview: String
    var poster_path: String
    var adult: Bool
    var release_date: String
    var vote_average: Double
    
}

struct MovieConfiguration: Codable {
    var images: ImagesConfiguration
}

struct ImagesConfiguration: Codable {
    var base_url: String
    var poster_sizes: [String]
}
