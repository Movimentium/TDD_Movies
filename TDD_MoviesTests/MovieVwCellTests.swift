//
//  MovieVwCellTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 17/7/24.
//

import XCTest

@testable import TDD_Movies
final class MovieVwCellTests: XCTestCase {
    
    var tableVw: UITableView!
    var mockDataSource: MockCellDataSource!

    let testMovie1 = Movie(title: "Batman Begins", releaseDate: "2005")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
        let libraryVC = mainSb.instantiateViewController(withIdentifier: "\(LibraryVC.self)") as! LibraryVC
        _ = libraryVC.view
        
        tableVw = libraryVC.tableVw
        mockDataSource = MockCellDataSource()
        tableVw.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableVw.dequeueReusableCell(withIdentifier: kIdMovieCell, for: IndexPath(row: 0, section: 0)) as! MovieVwCell
        cell.config(withMovie: testMovie1)
        
        XCTAssertEqual(cell.textLabel?.text, testMovie1.title)
        XCTAssertEqual(cell.detailTextLabel?.text, testMovie1.releaseDate)
    }
    
 
    
}
