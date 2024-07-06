//
//  MovieManager.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 6/7/24.
//

import Foundation

final class MovieManager {
    var moviesToSeeCount: Int { moviesToSee.count }
    var moviesSeenCount: Int { moviesSeen.count}
    
    private var moviesToSee: [Movie] = []
    private var moviesSeen: [Movie] = []
    
    func add(movie: Movie) {
        if moviesToSee.contains(movie) { return }
        moviesToSee.append(movie)
    }
    
    func movie(atIndex idx: Int) -> Movie {
        return moviesToSee[idx]
    }
    
    func checkOffMovie(atIndex idx: Int) {
        guard idx < moviesToSeeCount else { return }
        let checkedMovie = moviesToSee.remove(at: idx)
        moviesSeen.append(checkedMovie)
    }
    
    func checkedOffMovie(atIndex idx: Int) -> Movie {
        return moviesSeen[idx]
    }
    
    func clearArrays() {
        moviesToSee.removeAll()
        moviesSeen.removeAll()
    }
}
