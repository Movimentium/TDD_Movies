//
//  LibraryVC.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 5/7/24.
//

import UIKit

class LibraryVC: UIViewController {

    @IBOutlet weak var tableVw: UITableView!
    private let movieLibraryDataService = MovieLibraryDataService()
    private let movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVw.dataSource = movieLibraryDataService
        tableVw.delegate = movieLibraryDataService
        movieLibraryDataService.movieManager = movieManager
        
        addDummyData()
        tableVw.reloadData()
        
        print(#function)
    }
    
    private func addDummyData() {
        DummyData.movies.forEach { movieManager.add(movie: $0) }
    }


}
