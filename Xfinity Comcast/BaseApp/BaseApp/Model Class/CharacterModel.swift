//
//  SimpsonsCharacterModel.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

public struct CharacterModel : Codable {
    
	let relatedTopics : [RelatedTopics]?

	enum CodingKeys: String, CodingKey {
		case relatedTopics = "RelatedTopics"
	}

    public init(from decoder: Decoder) throws {
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
        relatedTopics = try values.decodeIfPresent([RelatedTopics].self, forKey: .relatedTopics)
        
	}

}
