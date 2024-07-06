//
//  MovieManager.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 6/7/24.
//

import Foundation

final class MovieManager {
    var moviesToSeeCount = 0
    let moviesSeenCount = 0
    
    private var moviesToSee: [Movie] = []
    
    func add(movie: Movie) {
        moviesToSeeCount += 1
        moviesToSee.append(movie)
    }
    
    func movie(atIndex idx: Int) -> Movie {
        return moviesToSee[idx]
    }
}
