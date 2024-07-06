//
//  MovieManagerTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 6/7/24.
//

import XCTest

@testable import TDD_Movies
final class MovieManagerTests: XCTestCase {
    
    let testMovie = Movie(title: "Batman")
    let testMovie2 = Movie(title: "Possessor")
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
        sut.add(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.add(movie: testMovie)
        let movieQueried = sut.movie(atIndex: 0)
        
        XCTAssertEqual(testMovie.title, movieQueried.title)
    }
    
    // MARK: - Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.add(movie: testMovie)
        sut.checkOffMovie(atIndex: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.add(movie: testMovie)
        sut.add(movie: testMovie2)
        sut.checkOffMovie(atIndex: 0)
        let movieQueried = sut.movie(atIndex: 0)
        
        XCTAssertEqual(movieQueried.title, testMovie2.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.add(movie: testMovie)
        sut.checkOffMovie(atIndex: 0)
        let movieQueried = sut.checkedOffMovie(atIndex: 0)
        
        XCTAssertEqual(testMovie.title, movieQueried.title)
    }
}
