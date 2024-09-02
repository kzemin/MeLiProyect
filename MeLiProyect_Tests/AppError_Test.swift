//
//  SearchViewModel_Test.swift
//  MeLiProyect_Tests
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import XCTest
@testable import MeLiProyect

// MARK: - UNIT TESTS

final class AppError_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_HandleNonAppError() {
        // Given
        let errorHandler = ErrorHandler.shared
        
        // When
        let nonAppError = NSError(domain: "Test", code: 1, userInfo: nil)
        
        // Then
        errorHandler.handle(nonAppError)
        XCTAssertNil(errorHandler.currentError)
    }
}
