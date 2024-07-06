//
//  MovieManagerTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 6/7/24.
//

import XCTest

@testable import TDD_Movies
final class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!      // system under test

    override func setUpWithError() throws {
        sut = MovieManager()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: - Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        let testMovie = Movie(title: "Batman")
        sut.add(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        let testMovie = Movie(title: "Possessor")
        sut.add(movie: testMovie)
        
        let movieQueried = sut.movie(atIndex: 0)
        XCTAssertEqual(testMovie.title, movieQueried.title)
    }
    
}
