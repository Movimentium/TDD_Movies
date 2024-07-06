//
//  MovieStructTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 6/7/24.
//

import XCTest

@testable import TDD_Movies
final class MovieStructTests: XCTestCase {      // Press CMD + U

    private let movieTitle = "Memento"
    private let movieReleaseDate = "2000"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: movieTitle)
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, movieTitle)
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: movieTitle, releaseDate: movieReleaseDate)
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, movieReleaseDate)
    }

}
