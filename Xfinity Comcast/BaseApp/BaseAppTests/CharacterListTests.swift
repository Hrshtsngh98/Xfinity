//
//  CharacterListTests.swift
//  BaseAppTests
//
//  Created by Harshit Singh on 12/25/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import XCTest
@testable import BaseApp

class CharacterListTests: XCTestCase {
    
    var viewModel: CharacterListViewModel?
    
    override func setUp() {
        Constant.currentAppType = .SimpsonsCharacterViewer
        viewModel = CharacterListViewModel()
        let icon = Icon(url: "https://duckduckgo.com/i/f0eb79ee.png", height: nil, width: nil)
        let relatedTopic1 = RelatedTopics(firstUrl: "https://duckduckgo.com/Chief_Wiggum", result: "", text: "Chief Wiggum - Chief Clarence \"Clancy\" Wiggum is a fictional character from the animated television series The Simpsons, voiced by Hank Azaria. He is the chief of police in the show's setting of Springfield. He is the father of Ralph Wiggum and the husband of Sarah Wiggum.", icon: icon)
        let relatedTopic2 = RelatedTopics(firstUrl: "https://duckduckgo.com/Homer_Simpson", result: "", text: "Homer Simpson - Homer J. Simpson is a fictional character and the main protagonist of the American animated sitcom The Simpsons as the patriarch of the eponymous family.", icon: icon)
        viewModel?.relatedTopics = [relatedTopic1, relatedTopic2]
        viewModel?.backUpList = [relatedTopic1, relatedTopic2]
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
        XCTAssertNotNil(viewModel?.characterFactory)
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
    
    func testChracterFilter() {
        viewModel?.filterCharacterList(searchText: "Chief", completion: {
            guard let topic = self.viewModel?.relatedTopics, let backUpList = self.viewModel?.backUpList else {
                return
            }
            
            if topic.count == backUpList.count {
                XCTFail()
            }
            
            XCTAssertEqual(topic.count, 1)
            XCTAssertEqual(backUpList.count, 2)
            
        })
    }
}
