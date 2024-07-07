//
//  MovieLibraryDataService.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 7/7/24.
//

import UIKit

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
        return UITableViewCell()
    }
    
    // MARK: - Delegate
    
}
