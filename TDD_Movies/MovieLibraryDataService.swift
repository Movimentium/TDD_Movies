//
//  MovieLibraryDataService.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 7/7/24.
//

import UIKit

final class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    // MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager else { return 0 }
        return movieManager.moviesToSeeCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: - Delegate
    
}
