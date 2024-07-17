//
//  MockExtensions.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 8/7/24.
//

import UIKit
@testable import TDD_Movies

extension MovieLibraryDataServiceTests {
    
    class TableVwMock: UITableView {
        var cellDequeuedProperly = false
        
        static func tableVwMock(withDataService ds: MovieLibraryDataService) -> TableVwMock {
            let tableVwMock = TableVwMock(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 500)), style: .plain)
            tableVwMock.dataSource = ds
            tableVwMock.register(MovieVwCellMock.self, forCellReuseIdentifier: kIdMovieCell)
            return tableVwMock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieVwCellMock: MovieVwCell {
        var movieData: Movie?
        
        override func config(withMovie movie: Movie) {
            movieData = movie
        }
    }
}

extension MovieVwCellTests {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

