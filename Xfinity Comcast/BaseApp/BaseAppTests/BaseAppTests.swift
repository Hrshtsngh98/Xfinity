//
//  CharacterListTests.swift
//  CharacterViewerFrameworkTests
//
//  Created by Harshit Singh on 12/24/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import XCTest
@testable import BaseApp

class BaseAppTests: XCTestCase {
    
    var viewModel: CharacterListViewModel?
    
    override func setUp() {
        Constant.currentAppType = .SimpsonsCharacterViewer
        viewModel = CharacterListViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testCharacterService() {
        let expectation = XCTestExpectation(description: "Service Call Running.....")
        
        viewModel?.getData(completion: { (model, error) in
            if error == nil {
                self.viewModel?.relatedTopics = model!.relatedTopics!
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
    
    func testCharacterFactory() {
        guard viewModel?.characterFactory != nil else {
            XCTFail()
            return
        }
    }
    
    func testTitleString() {
        XCTAssertNotNil(viewModel?.titleString)
    }
    
    func testBackupList() {
        if viewModel?.relatedTopics.count != viewModel?.backUpList.count {
            XCTFail()
        }
    }
    
    
    func testRelatedTopic() {
        if let topic = viewModel?.relatedTopics, topic.count > 0 {
            XCTAssertNotNil(topic[0].firstURL)
            XCTAssertNotNil(topic[0].text)
        }
    }
}
