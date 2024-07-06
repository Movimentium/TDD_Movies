//
//  LibraryVCTests.swift
//  TDD_MoviesTests
//
//  Created by Miguel Gallego on 7/7/24.
//

import XCTest

@testable import TDD_Movies
final class LibraryVCTests: XCTestCase {

    var sut: LibraryVC!
    
    override func setUpWithError() throws {
        let sbName = "Main"
        let vcId = "\(LibraryVC.self)"
        sut = UIStoryboard(name: sbName, bundle: nil).instantiateViewController(withIdentifier: vcId) as? LibraryVC
        let _ = sut.view  // call sut.viewDidLoad()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Nil Checks
    func testLibraryVC_TableVwShouldNotBeNil() {
        XCTAssertNotNil(sut.tableVw)
    }
}
