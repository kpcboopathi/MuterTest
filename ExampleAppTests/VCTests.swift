//
//  VCTests.swift
//  ExampleAppTests
//
//  Created by Boopathi on 22/06/20.
//  Copyright © 2020 Sean Olszewski. All rights reserved.
//

import XCTest

class VCTests: XCTestCase {
    
    var objVC : ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.objVC = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let urlString = "http://httpstat.us/200"
        
        self.objVC.testWebService(urlString: urlString)
    }


    func testSuccess() throws {
        XCTAssertTrue(self.objVC.isResponseOK(nResponseCode: 200))
    }
    
    func testNotSuccess() throws {
        XCTAssertFalse(self.objVC.isResponseOK(nResponseCode: 201))
    }
    
     
    func testErrorCase1() throws {
        XCTAssertEqual("Forbidden", self.objVC.getErrorCode(ResponseCode(rawValue: 403)!))
    }
     
    func testErrorCase2() throws {
        XCTAssertNotEqual("Forbidden", self.objVC.getErrorCode(ResponseCode(rawValue: 200)!))
    }
    
    
    func testValidPassword() throws {
        XCTAssertTrue(self.objVC.isValidPassword("12345678", "12345678"))
    }
    
    func testInValidPassword() throws {
        XCTAssertFalse(self.objVC.isValidPassword("123456789", "123456788"))
    }
    
    

}
