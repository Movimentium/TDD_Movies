//
//  MovieLibraryDataService.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 7/7/24.
//

import UIKit

let kIdMovieCell = "idMovieCell"

enum LibrarySection: Int {
    case moviesToSee
    case moviesSeen
    
    init(section: Int) {
        self = (section == 0 ? .moviesToSee : .moviesSeen)
    }
}

final class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    // MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager else { return 0 }
        return switch LibrarySection(section: section) {
        case .moviesToSee:
            movieManager.moviesToSeeCount
        case .moviesSeen:
            movieManager.moviesSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager else { fatalError("\(Self.self) \(#function) movieManager is nil!!") }
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdMovieCell, for: indexPath) as! MovieVwCell
        switch LibrarySection(section: indexPath.section) {
        case .moviesToSee:
            let movie = movieManager.movieToSee(atIndex: indexPath.row)
            cell.config(withMovie: movie)
        case .moviesSeen:
            let movie = movieManager.checkedOffMovie(atIndex: indexPath.row)
            cell.config(withMovie: movie)
        }
        return cell
    }
    
    // MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager else { fatalError("\(Self.self) \(#function) movieManager is nil!!") }
        if LibrarySection(section: indexPath.section) == .moviesToSee {
            movieManager.checkOffMovie(atIndex: indexPath.row)
            tableView.reloadData()
        }
    }
}
