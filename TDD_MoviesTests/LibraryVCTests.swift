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
        let vcId = "\(LibraryVC.self)"
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(withIdentifier: vcId) as? LibraryVC
        let _ = sut.view  // call sut.viewDidLoad() then the tableVw is loaded
 
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Nil Checks
    func testLibraryVC_TableVwShouldNotBeNil() {
        XCTAssertNotNil(sut.tableVw)
    }
    
    // MARK: - Data Source
    func testDataSource_ViewDidLoad_SetsTableVwDataSource() {
        XCTAssertNotNil(sut.tableVw.dataSource)
        XCTAssertTrue(sut.tableVw.dataSource is MovieLibraryDataService)
    }
    
    // MARK: - Delegate
    func testDelegate_ViewDidLoad_SetsTableVwDelegate() {
        XCTAssertNotNil(sut.tableVw.delegate)
        XCTAssertTrue(sut.tableVw.delegate is MovieLibraryDataService)
    }
    
    // MARK: - Data Service Assumptions
    func testDataService_ViewDidLoad_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableVw.dataSource as! MovieLibraryDataService,
                       sut.tableVw.delegate as! MovieLibraryDataService)
    }
    
}
