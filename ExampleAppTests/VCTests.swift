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
    
    
    func testValidPassword() throws {
        XCTAssertTrue(self.objVC.isValidPassword("123456789Aa"))
    }

    func testInValidPassword_LessChars() throws {
        XCTAssertFalse(self.objVC.isValidPassword("12345Aa"))
    }

    func testInValidPassword_MoreChars() throws {
        XCTAssertFalse(self.objVC.isValidPassword("123456789Aa12345"))
    }


    func testValidConfirmPassword() throws {
        XCTAssertTrue(self.objVC.isValidConfirmPassword("123456789Aa", "123456789Aa"))
    }
    func testInValidConfirmPassword_Mismatch() throws {
        XCTAssertFalse(self.objVC.isValidConfirmPassword("123456789Aa", "123456789Ab"))
    }
    

}
