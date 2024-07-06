//
//  MovieManagerTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 6/7/24.
//

import XCTest

@testable import TDD_Movies
final class MovieManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MoviesToSee_ReturnsZero() {
        let sut = MovieManager() 
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    

}
