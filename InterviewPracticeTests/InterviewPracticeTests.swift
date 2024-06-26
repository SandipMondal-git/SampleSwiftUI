//
//  InterviewPracticeTests.swift
//  InterviewPracticeTests
//
//  Created by Sandip Mondal on 25/06/24.
//

import XCTest
@testable import InterviewPractice

final class InterviewPracticeTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiFetch() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let apiManager = ApiManager()
        do {
            let data : [Product] = try await apiManager.request(urlString: "https://fakestoreapi.com/products")
            XCTAssertNotNil(data)
            //XCTAssertIdentical(data as AnyObject, [Product].self as AnyObject)
            
            assert((data as Any) is [Product])
            
        } catch {
            XCTAssertThrowsError(error, "Api error")
        }
        
    }

}
