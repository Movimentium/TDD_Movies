//
//  MovieLibraryDataServiceTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 7/7/24.
//

import XCTest

@testable import TDD_Movies
final class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var tableVw: UITableView!
    
    let testMovie1 = Movie(title: "Batman Begins", releaseDate: "2005")
    let testMovie2 = Movie(title: "Possessor", releaseDate: "2020")
    let testMovie3 = Movie(title: "Dune: Part Three")
    
    override func setUpWithError() throws {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        tableVw = UITableView()
        tableVw.dataSource = sut
        tableVw.delegate = sut
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Sections
    func testTableVwSections_Count_ReturnsTwo() {
        let sections = tableVw.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableVwSections_SectionOne_ReturnsMoviesToSeeCount() {
        sut.movieManager?.add(movie: testMovie1)
        sut.movieManager?.add(movie: testMovie2)
        
        XCTAssertEqual(tableVw.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.add(movie: testMovie3)
        tableVw.reloadData()
        
        XCTAssertEqual(tableVw.numberOfRows(inSection: 0), 3)
    }
}
