//
//  Icon.swift
//  CharacterViewerFramework
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

struct Icon : Codable {
	let height : String?
	let width : String?
	let url : String?

	enum CodingKeys: String, CodingKey {
		case height = "Height"
		case width = "Width"
		case url = "URL"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        height = try values.decodeIfPresent(String.self, forKey: .height)
        width = try values.decodeIfPresent(String.self, forKey: .width)
        url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
