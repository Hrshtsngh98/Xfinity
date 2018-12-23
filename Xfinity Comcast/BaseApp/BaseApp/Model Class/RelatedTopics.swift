//
//  RelatedTopics.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

struct RelatedTopics : Codable {
	let firstURL : String?
	let result : String?
	let icon : Icon?
	let text : String?

	enum CodingKeys: String, CodingKey {

		case firstURL = "FirstURL"
		case result = "Result"
		case icon = "Icon"
		case text = "Text"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		firstURL = try values.decodeIfPresent(String.self, forKey: .firstURL)
		result = try values.decodeIfPresent(String.self, forKey: .result)
		icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
		text = try values.decodeIfPresent(String.self, forKey: .text)
	}

}
