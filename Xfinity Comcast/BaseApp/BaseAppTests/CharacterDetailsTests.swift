//
//  CharacterDetailsTests.swift
//  BaseAppTests
//
//  Created by Harshit Singh on 12/25/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import XCTest
@testable import BaseApp

class CharacterDetailsTests: XCTestCase {

    var viewModel: CharacterDetailViewModel?
    
    override func setUp() {
        Constant.currentAppType = .SimpsonsCharacterViewer
        let icon = Icon(url: "https://duckduckgo.com/i/f0eb79ee.png", height: nil, width: nil)
        let relatedTopic = RelatedTopics(firstUrl: "https://duckduckgo.com/Chief_Wiggum", result: "", text: "Chief Wiggum - Chief Clarence \"Clancy\" Wiggum is a fictional character from the animated television series The Simpsons, voiced by Hank Azaria. He is the chief of police in the show's setting of Springfield. He is the father of Ralph Wiggum and the husband of Sarah Wiggum.", icon: icon)
        viewModel = CharacterDetailViewModel(topic: relatedTopic)
        
    }

    override func tearDown() {
        viewModel = nil
    }
    
    func testRelatedTopic() {
        XCTAssertNotNil(viewModel?.relatedTopic)
        XCTAssertNotNil(viewModel?.relatedTopic.firstURL)
        XCTAssertNotNil(viewModel?.relatedTopic.result)
        XCTAssertNotNil(viewModel?.relatedTopic.text)
    }



}
