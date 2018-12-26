//
//  StringsTests.swift
//  BaseAppTests
//
//  Created by Harshit Singh on 12/25/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import XCTest
@testable import BaseApp

class StringsTests: XCTestCase {

    var testString: String? = nil
    
    override func setUp() {
        testString = "Homer Simpson - Homer J. Simpson is a fictional character"
    }

    override func tearDown() {
        testString = nil
    }

    func testSplitByHyphen() {
        
        guard let testString = self.testString else {
            return
        }
        
        let array = testString.splitByHyphen()
        XCTAssertEqual(array.count, 2)
        XCTAssertNotNil(array[0])
        XCTAssertNotNil(array[1])
        XCTAssertEqual(array[0], "Homer Simpson")
        XCTAssertEqual(array[1], "Homer J. Simpson is a fictional character")
        
    }

}
