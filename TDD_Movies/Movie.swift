//
//  Movie.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 6/7/24.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.title == rhs.title &&
        lhs.releaseDate == rhs.releaseDate
    }
}
