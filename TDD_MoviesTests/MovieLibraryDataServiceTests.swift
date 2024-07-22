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
    var libraryVC: LibraryVC!
    var tableMock: TableVwMock!
    
    let testMovie1 = Movie(title: "Batman Begins", releaseDate: "2005")
    let testMovie2 = Movie(title: "Possessor", releaseDate: "2020")
    let testMovie3 = Movie(title: "Dune: Part Three")
    
    override func setUpWithError() throws {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        tableMock = TableVwMock.tableVwMock(withDataService: sut)
        
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
        libraryVC = mainSb.instantiateViewController(withIdentifier: "\(LibraryVC.self)") as? LibraryVC
        _ = libraryVC.view
        
        tableVw = libraryVC.tableVw
        tableVw.dataSource = sut
        tableVw.delegate = sut
        
        // Put setup code here. This method is called before the invocation of each test method in the class
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Sections
    func testTableVwSections_Count_ReturnsTwo() {
        let sections = tableVw.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
//    func testTableVwSections_SectionZero_ReturnsMoviesToSeeCount() {
//        sut.movieManager?.add(movie: testMovie1)
//        sut.movieManager?.add(movie: testMovie2)
//        XCTAssertEqual(tableVw.numberOfRows(inSection: 0), 2)
//        
//        sut.movieManager?.add(movie: testMovie3)
//        tableVw.reloadData()
//        XCTAssertEqual(tableVw.numberOfRows(inSection: 0), 3)
//    }
//    
//    func testTableVwSections_SectionOne_ReturnsMoviesSeenCount() {
//        sut.movieManager?.add(movie: testMovie1)
//        sut.movieManager?.add(movie: testMovie2)
//        sut.movieManager?.checkOffMovie(atIndex: 0)
//        XCTAssertEqual(tableVw.numberOfRows(inSection: 1), 1)
//        
//        sut.movieManager?.checkOffMovie(atIndex: 0)
//        tableVw.reloadData()
//        XCTAssertEqual(tableVw.numberOfRows(inSection: 1), 2)
//    }
    
    // MARK: - Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.add(movie: testMovie1)
        tableVw.reloadData()
        let idp = IndexPath(row: 0, section: 0)
        let cellQueried = tableVw.cellForRow(at: idp)
        XCTAssertTrue(cellQueried is MovieVwCell)
    }
    
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.add(movie: testMovie1)
        tableMock.reloadData()
        _ = tableMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableMock.cellDequeuedProperly)
    }
    
    func testCell_SectionZeroConfig_ShouldSetCellData() {
        sut.movieManager?.add(movie: testMovie1)
        tableMock.reloadData()
        let cell = tableMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieVwCellMock
        XCTAssertEqual(cell.movieData, testMovie1)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.add(movie: testMovie1)
        sut.movieManager?.add(movie: testMovie2)
        sut.movieManager?.checkOffMovie(atIndex: 0)
        tableMock.reloadData()
        
        let cell = tableMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieVwCellMock
        XCTAssertEqual(cell.movieData, testMovie1)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.add(movie: testMovie1)
        sut.movieManager?.add(movie: testMovie2)
        tableVw.delegate?.tableView?(tableVw, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(tableVw.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableVw.numberOfRows(inSection: 1), 1)
    }
    
    func testTableVwSectionTitles_ShouldHaveCorrectStringValues() {
        let titleSection0 = tableVw.dataSource?.tableView?(tableVw, titleForHeaderInSection: 0) ?? ""
        let titleSection1 = tableVw.dataSource?.tableView?(tableVw, titleForHeaderInSection: 1) ?? ""
        
        XCTAssertEqual(titleSection0, LibrarySection.moviesToSee.str)
        XCTAssertEqual(titleSection1, LibrarySection.moviesSeen.str)
    }
    
    
}

